#include "backend/generator.h"

#include <assert.h>

#define TODO assert(0 && "todo")

std::string rv::toString(rvREG r)
{
    switch (r)
    {
    case rvREG::zero:
        return "zero";
    case rvREG::ra:
        return "ra";
    case rvREG::sp:
        return "sp";
    case rvREG::gp:
        return "gp";
    case rvREG::tp:
        return "tp";
    case rvREG::t0:
        return "t0";
    case rvREG::t1:
        return "t1";
    case rvREG::t2:
        return "t2";
    case rvREG::fp:
        return "fp";
    case rvREG::s1:
        return "s1";
    case rvREG::a0:
        return "a0";
    case rvREG::a1:
        return "a1";
    case rvREG::a2:
        return "a2";
    case rvREG::a3:
        return "a3";
    case rvREG::a4:
        return "a4";
    case rvREG::a5:
        return "a5";
    case rvREG::a6:
        return "a6";
    case rvREG::a7:
        return "a7";
    case rvREG::s2:
        return "s2";
    case rvREG::s3:
        return "s3";
    case rvREG::s4:
        return "s4";
    case rvREG::s5:
        return "s5";
    case rvREG::s6:
        return "s6";
    case rvREG::s7:
        return "s7";
    case rvREG::s8:
        return "s8";
    case rvREG::s9:
        return "s9";
    case rvREG::s10:
        return "s10";
    case rvREG::s11:
        return "s11";
    case rvREG::t3:
        return "t3";
    case rvREG::t4:
        return "t4";
    case rvREG::t5:
        return "t5";
    case rvREG::t6:
        return "t6";
    default:
        assert(0 && "illegal rvREG");
        break;
    }
}

// 向 table 中添加变量并维护变量与偏移量的映射
int backend::stackVarMap::add_operand(ir::Operand op, uint32_t size = 4)
{
    _table.emplace(op.name, size);
}

int backend::stackVarMap::find_operand(ir::Operand op)
{
    if (_table.find(op.name) == _table.end())
        return -1; // 未找到
    else
        return _table[op.name];
}

backend::Generator::Generator(ir::Program &p, std::ofstream &f) : program(p), fout(f)
{
    // TODO
}

// 固定寄存器分配
rv::rvREG backend::Generator::getRd(ir::Operand)
{
    return rv::rvREG::t2;
}

rv::rvREG backend::Generator::getRs1(ir::Operand)
{
    return rv::rvREG::t0;
}
rv::rvREG backend::Generator::getRs2(ir::Operand)
{
    return rv::rvREG::t1;
}

void backend::Generator::gen_global(const ir::Function &func)
{
    std::vector<std::string> bss_inst, data_inst;
    // 遍历global所有指令
    for (int i = 0; i < func.InstVec.size(); i++)
    {
        auto inst = func.InstVec[i];
        if (inst->op == ir::Operator::def)
        {
            global_var.push_back(inst->des.name);
            // 如果没有初始化，则放到bss段
            if (inst->op1.name == "0")
                bss_inst.push_back("\t" + inst->des.name + ": .word 0");
            else // 否则放到data段
                data_inst.push_back("\t" + inst->des.name + ": .word " + inst->op1.name);
        }
        else if (inst->op == ir::Operator::alloc)
        {
            global_var.push_back(inst->des.name);
            // 未初始化数组
            if (i == func.InstVec.size() - 1 || func.InstVec[i + 1]->op != ir::Operator::store)
            {
                bss_inst.push_back("\t" + inst->des.name + ".space " + inst->op1.name + " * 4");
            }
            else // 初始化数组
            {
                // 记录初始化数值
                int init_val[std::stoi(inst->op1.name)] = {0};
                for (int j = i + 1; j < func.InstVec.size(); j++)
                {
                    auto inst_store = func.InstVec[j];
                    if (inst_store->op == ir::Operator::store)
                    {
                        init_val[std::stoi(inst_store->op2.name)] = std::stoi(inst_store->des.name);
                    }
                    else
                    {
                        break;
                    }
                }
                // 将初始化数组放到data段
                std::string data = "\t" + inst->des.name + ": .word ";
                for (int j = 0; j < std::stoi(inst->op1.name); j++)
                {
                    if (j == std::stoi(inst->op1.name) - 1)
                    {
                        data += std::to_string(init_val[j]);
                    }
                    else
                    {
                        data += std::to_string(init_val[j]) + ", ";
                    }
                }
                data_inst.push_back(data);
            }
        }
    }

    // 将bss段和data段写入文件
    if (!bss_inst.empty())
    {
        fout << "\t.bss" << std::endl;
        for (auto &inst : bss_inst)
        {
            fout << inst << std::endl;
        }
    }

    if (!data_inst.empty())
    {
        fout << "\t.data" << std::endl;
        for (auto &inst : data_inst)
        {
            fout << inst << std::endl;
        }
    }
}

void backend::Generator::gen()
{
    // 生成全局变量
    gen_global(program.functions.back()); // 最后一个函数是global
    // 代码段开始
    fout << "\t.text" << std::endl;
    // 表明函数入口
    fout << "\t.globl main" << std::endl;
    // 按字对齐
    fout << "\t.align 2" << std::endl;
    // 遍历生成所有函数
    for (auto &func : program.functions)
    {
        // 跳过global函数
        if (func.name == "global")
            break;
        gen_func(func);
    }
}

bool backend::Generator::is_globalvar(std::string name)
{
    for (auto &var : global_var)
    {
        if (var == name)
            return true;
    }
    return false;
}

// 计算函数内局部变量所需栈空间大小
int backend::Generator::alloc_stack(const ir::Function &func)
{
    int size = 0;
    // 遍历所有指令
    for (auto &inst : func.InstVec)
    {
        // 函数参数
        size += func.ParameterList.size();
        // op1
        if (!is_globalvar(inst->op1.name) && inst->op1.type != ir::Type::null && inst->op1.type != ir::Type::IntLiteral)
            size += 1;
        // op2
        if (!is_globalvar(inst->op2.name) && inst->op2.type != ir::Type::null && inst->op2.type != ir::Type::IntLiteral)
            size += 1;
        // des
        if (!is_globalvar(inst->des.name) && inst->des.type != ir::Type::null && inst->des.type != ir::Type::IntLiteral)
            size += 1;
        // alloc
        if (inst->op == ir::Operator::alloc)
            size += std::stoi(inst->op1.name);
    }
    return size;
}

// 函数初始化
void backend::Generator::init_func(const ir::Function &func)
{
    local_stack._table.clear();
    j_label.clear();
    // 生成函数名
    fout << func.name << ":" << std::endl;
    cur_ofs = 0;
    ir_idx = 0;
    // 预先分配调用栈空间
    fout << "\taddi sp, sp, -" << std::to_string(alloc_stack(func) * 4 + 4 * 13) << std::endl;
    // 处理保留寄存器和栈帧
    // 将 callee saved registers 保存到栈上 ra, s0-s11
    fout << "\tsw ra, 0(sp)" << std::endl;
    for (int i = 1; i < 13; i++)
    {
        fout << "\tsw s" << i - 1 << ", " << 4 * i << "(sp)" << std::endl;
    }
    cur_ofs += 4 * 13;
    // 保存函数参数
    for (int i = 0; i < func.ParameterList.size(); i++)
    {
        local_stack.add_operand(func.ParameterList[i], cur_ofs);
        cur_ofs += 4;
        fout << "\tsw a" << i << ", " << local_stack.find_operand(func.ParameterList[i]) << "(sp)" << std::endl;
    }

    // 给每条ir指令对应的第一条汇编指令打上标签,标签内容就为指令本身
    for (int i = 0; i < func.InstVec.size(); i++)
    {
        j_label.emplace(i, func.name + "_label_" + std::to_string(i));
    }
}

// 函数返回清理栈空间
void backend::Generator::clear_stack(const ir::Function &func)
{
    // 恢复 callee saved registers
    for (int i = 1; i < 13; i++)
    {
        fout << "\tlw s" << i - 1 << ", " << 4 * i << "(sp)" << std::endl;
    }
    fout << "\tlw ra, 0(sp)" << std::endl;
    // 清理栈空间
    fout << "\taddi sp, sp, " << std::to_string(alloc_stack(func) * 4 + 4 * 13) << std::endl;
}

void backend::Generator::gen_func(const ir::Function &func)
{
    // 初始化函数
    init_func(func);
    // 处理指令
    for (int i = 0; i < func.InstVec.size(); i++)
    {
        // 生成指令前都把该条ir指令输出为注释, null类型不输出
        if (func.InstVec[i]->op != ir::Operator::__unuse__)
            fout << "# " << func.InstVec[i]->draw() << std::endl;
        if (func.name.substr(0, 4) == "main" && i == 0)
        {
            ir_idx++;
            fout << j_label[0] << ":" << std::endl;
            // main函数第一条指令为call global，已经在gen_global中处理
            continue;
        }
        // 输出ir指令label
        fout << j_label[i] << ":" << std::endl;
        if (func.InstVec[i]->op == ir::Operator::call)
        {
            // 把call指令转化为callinst子类型
            gen_call_instr(*(ir::CallInst *)func.InstVec[i]);
            ir_idx++;
            continue;
        }
        gen_instr(*func.InstVec[i]);
        ir_idx++;
    }

    // 函数返回清理栈空间
    clear_stack(func);
    // 跳回调用函数
    fout << "\tret" << std::endl;
}

std::string backend::Generator::get_realvar(std::string name)
{
    if (is_globalvar(name))
        return name; // 返回全局变量名
    else if (local_stack.find_operand(ir::Operand(name, ir::Type::null)) == -1)
        return std::to_string(local_stack.find_operand(ir::Operand(name, ir::Type::null))) + "(sp)"; // 返回局部变量在内存中的位置
}

void backend::Generator::gen_operate_instr(const ir::Instruction &inst)
{
    // e.g add rd, rs1, rs2
    // 若为局部变量，先将其加载到寄存器中
    auto rd = rv::toString(getRd(inst.des));
    auto rs1 = rv::toString(getRs1(inst.op1));
    auto rs2 = rv::toString(getRs2(inst.op2));
    if (!is_globalvar(inst.op1.name))
    {
        // 因为有常量传播，所以仍然可能出现常数
        if (inst.op1.type == ir::Type::IntLiteral)
            fout << "\tli t0, " << inst.op1.name << std::endl;
        else if (local_stack.find_operand(inst.op1) != -1  // 局部变量
                 && inst.op1.type != ir::Type::IntLiteral) // 非常数
            fout << "\tlw t0, " << local_stack.find_operand(inst.op1) << "(sp)" << std::endl;
    }
    else
        fout << "\tlw t0"
             << ", " << inst.op1.name << std::endl;
    if (!is_globalvar(inst.op2.name))
    {
        if (inst.op2.type == ir::Type::IntLiteral)
            fout << "\tli t1, " << inst.op2.name << std::endl;
        else if (local_stack.find_operand(inst.op2) != -1  // 局部变量
                 && inst.op2.type != ir::Type::IntLiteral) // 非常数
            fout << "\tlw t1, " << local_stack.find_operand(inst.op2) << "(sp)" << std::endl;
    }
    else
        fout << "\tlw t1"
             << ", " << inst.op2.name << std::endl;
    // 进行运算
    if (inst.op == ir::Operator::mod) // mod->rem, 其余相同
        fout << "\trem " << rd << ", " << rs1 << ", " << rs2 << std::endl;
    else
        fout << "\t" << ir::toString(inst.op) << " " << rd << ", " << rs1 << ", " << rs2 << std::endl;
    // 将结果存回内存
    if (is_globalvar(inst.des.name))
        fout << "\tsw " << rd << ", " << inst.des.name << std::endl;
    else if (local_stack.find_operand(inst.des) != -1)
        fout << "\tsw " << rd << ", " << local_stack.find_operand(inst.des) << "(sp)" << std::endl;
    else if (inst.des.type != ir::Type::null && inst.des.type != ir::Type::IntLiteral)
    {
        local_stack.add_operand(inst.des, cur_ofs);
        fout << "\tsw " << rd << ", " << cur_ofs << "(sp)" << std::endl;
        cur_ofs += 4;
    }
}

void backend::Generator::gen_logic_instr(const ir::Instruction &inst)
{
    // e.g slt rd rs1 rs2
    // 若为局部变量，先将其加载到寄存器中
    auto rd = rv::toString(getRd(inst.des));
    auto rs1 = rv::toString(getRs1(inst.op1));
    auto rs2 = rv::toString(getRs2(inst.op2));
    if (!is_globalvar(inst.op1.name))
    {
        // 因为有常量传播，所以仍然可能出现常数
        if (inst.op1.type == ir::Type::IntLiteral)
            fout << "\tli t0, " << inst.op1.name << std::endl;
        else if (local_stack.find_operand(inst.op1) != -1  // 局部变量
                 && inst.op1.type != ir::Type::IntLiteral) // 非常数
            fout << "\tlw t0, " << local_stack.find_operand(inst.op1) << "(sp)" << std::endl;
    }
    else
        fout << "\tlw t0"
             << ", " << inst.op1.name << std::endl;
    if (!is_globalvar(inst.op2.name))
    {
        if (inst.op2.type == ir::Type::IntLiteral)
            fout << "\tli t1, " << inst.op2.name << std::endl;
        else if (local_stack.find_operand(inst.op2) != -1  // 局部变量
                 && inst.op2.type != ir::Type::IntLiteral) // 非常数
            fout << "\tlw t1, " << local_stack.find_operand(inst.op2) << "(sp)" << std::endl;
    }
    else
        fout << "\tlw t1"
             << ", " << inst.op2.name << std::endl;
    // 进行运算
    switch (inst.op)    // 不能用not 
    {
    case ir::Operator::lss:
        fout << "\tslt " << rd << ", " << rs1 << ", " << rs2 << std::endl;
        break;
    case ir::Operator::gtr:
        fout << "\tslt " << rd << ", " << rs1 << ", " << rs2 << std::endl;
        fout << "\tseqz " << rd << ", " << rd << std::endl;
        break;
    case ir::Operator::leq:
        fout << "\tslt " << rd << ", " << rs2 << ", " << rs1 << std::endl; // 判断反命题
        fout << "\tseqz " << rd << ", " << rd << std::endl;                // 取反
        break;
    case ir::Operator::geq:
        fout << "\tslt " << rd << ", " << rs1 << ", " << rs2 << std::endl; // 判断反命题
        fout << "\tseqz " << rd << ", " << rd << std::endl;                // 取反
        break;
    case ir::Operator::eq:
        fout << "\tsub " << rd << ", " << rs1 << ", " << rs2 << std::endl;
        fout << "\tseqz " << rd << ", " << rd << std::endl;
        break;
    case ir::Operator::neq:
        fout << "\tsub " << rd << ", " << rs1 << ", " << rs2 << std::endl;
        fout << "\tsnez " << rd << ", " << rd << std::endl;
        break;
    case ir::Operator::_not:
        fout << "\tseqz " << rd << ", " << rs1 << std::endl;
        break;
    }
    // 将结果存回内存
    if (is_globalvar(inst.des.name))
        fout << "\tsw " << rd << ", " << inst.des.name << std::endl;
    else if (local_stack.find_operand(inst.des) != -1)
        fout << "\tsw " << rd << ", " << local_stack.find_operand(inst.des) << "(sp)" << std::endl;
    else if (inst.des.type != ir::Type::null && inst.des.type != ir::Type::IntLiteral)
    {
        local_stack.add_operand(inst.des, cur_ofs);
        fout << "\tsw " << rd << ", " << cur_ofs << "(sp)" << std::endl;
        cur_ofs += 4;
    }
}

void backend::Generator::gen_call_instr(const ir::CallInst &inst)
{
    // call func, arg1, arg2, ...
    // 将参数存入a0-a7
    for (int i = 0; i < inst.argumentList.size(); i++)
    {
        if (inst.argumentList[i].type == ir::Type::IntLiteral)
            fout << "\tli a" << i << ", " << inst.argumentList[i].name << std::endl;
        else
        {
            if (is_globalvar(inst.argumentList[i].name))
                fout << "\tlw a" << i << ", " << inst.argumentList[i].name << std::endl;
            else
                fout << "\tlw a" << i << ", " << local_stack.find_operand(inst.argumentList[i]) << "(sp)" << std::endl;
        }
    }
    // 调用函数
    fout << "\tcall " << inst.op1.name << std::endl;
    // 将返回值存入局部变量
    if (inst.des.type != ir::Type::null && inst.des.type != ir::Type::IntLiteral)
    {
        local_stack.add_operand(inst.des, cur_ofs);
        fout << "\tsw a0, " << cur_ofs << "(sp)" << std::endl;
        cur_ofs += 4;
    }
}

void backend::Generator::gen_instr(const ir::Instruction &inst)
{
    switch (inst.op)
    {
    case ir::Operator::_return:
    {
        // return null
        if (inst.op1.name == "")
        {
            fout << "\tret" << std::endl;
        }
        else
        {
            // return value
            // return IntLiteral
            if (inst.op1.type == ir::Type::IntLiteral)
                fout << "\tli a0, " << inst.op1.name << std::endl;
            else
            {
                // return variable
                // lw
                if (is_globalvar(inst.op1.name))
                    fout << "\tlw a0, " << inst.op1.name << std::endl;
                else
                    fout << "\tlw a0, " << local_stack.find_operand(inst.op1) << "(sp)" << std::endl;
            }
        }
        break;
    }
    case ir::Operator::def:
    {
        local_stack.add_operand(inst.des, cur_ofs);
        if (inst.op1.type == ir::Type::IntLiteral)
        {
            // li rd, imm
            fout << "\tli " << rv::toString(getRd(inst.des)) << ", " << inst.op1.name << std::endl;
            fout << "\tsw " << rv::toString(getRd(inst.des)) << ", " << cur_ofs << "(sp)" << std::endl;
            cur_ofs += 4;
        }
        else
        {
            // 赋的初始值是否是全局变量
            if (is_globalvar(inst.op1.name))
            {
                // la rd, global_var
                fout << "\tla " << rv::toString(getRd(inst.des)) << ", " << inst.op1.name << std::endl;
                fout << "\tsw " << rv::toString(getRd(inst.des)) << ", " << cur_ofs << "(sp)" << std::endl;
                cur_ofs += 4;
            }
            else
            {
                // la rd, local_var
                fout << "\tlw " << rv::toString(getRd(inst.des)) << ", " << local_stack.find_operand(inst.op1) << "(sp)" << std::endl;
                fout << "\tsw " << rv::toString(getRd(inst.des)) << ", " << cur_ofs << "(sp)" << std::endl;
                cur_ofs += 4;
            }
        }
        break;
    }
    case ir::Operator::alloc:
    {
        // alloc rd, size
        int arr_size = std::stoi(inst.op1.name) * 4;
        local_stack.add_operand(inst.des, cur_ofs);
        cur_ofs += arr_size;
        break;
    }
    case ir::Operator::mov:
    {
        // mov rd, rs1
        if (inst.op1.type == ir::Type::IntLiteral)
        {
            fout << "\tli " << rv::toString(getRd(inst.des)) << ", " << inst.op1.name << std::endl;
        }
        else
        {
            fout << "\tlw " << rv::toString(getRd(inst.des)) << ", " << local_stack.find_operand(inst.op1) << "(sp)" << std::endl;
        }
        // 将结果存回
        if (is_globalvar(inst.des.name))
        {
            // la rd, global_var
            fout << "\tla "
                 << "t3"
                 << ", " << inst.des.name << std::endl;
            fout << "\tsw " << rv::toString(getRd(inst.des)) << ", "
                 << "0(t3)" << std::endl;
        }
        else if (local_stack.find_operand(inst.des) != -1)
            fout << "\tsw " << rv::toString(getRd(inst.des)) << ", " << local_stack.find_operand(inst.des) << "(sp)" << std::endl;
        else if (inst.des.type != ir::Type::null && inst.des.type != ir::Type::IntLiteral)
        {
            local_stack.add_operand(inst.des, cur_ofs);
            fout << "\tsw " << rv::toString(getRd(inst.des)) << ", " << cur_ofs << "(sp)" << std::endl;
            cur_ofs += 4;
        }
        break;
    }
    // 算术指令
    case ir::Operator::add:
    case ir::Operator::sub:
    case ir::Operator::mul:
    case ir::Operator::div:
    case ir::Operator::mod:
    {
        gen_operate_instr(inst);
        break;
    }
    case ir::Operator::load:
    {
        // lw rd, rs1, rs2
        std::string base_addr;
        if (is_globalvar(inst.op1.name)) // 判断数组是否为全局变量
        {
            // load 全局数组变量的地址
            fout << "\tla " + rv::toString(getRd(inst.des)) + ", " << inst.op1.name << std::endl;
            base_addr = rv::toString(getRd(inst.op1));
        }
        else
        {
            base_addr = std::to_string(local_stack.find_operand(inst.op1));
        }
        std::string target_addr = base_addr;
        if (inst.op2.type == ir::Type::IntLiteral)
            if (is_globalvar(inst.op1.name))
                // 计算基址加偏移量
                fout << "\tadd " << rv::toString(getRd(inst.des)) << ", " << base_addr << ", " << std::stoi(inst.op2.name) * 4 << std::endl;
            else
                target_addr = std::to_string(std::stoi(inst.op2.name) * 4 + std::stoi(target_addr));
        else
        {
            if (is_globalvar(inst.op2.name))
                fout << "\tlw t0, " << inst.op2.name << std::endl;
            else
                fout << "\tlw t0, " << local_stack.find_operand(inst.op2) << "(sp)" << std::endl;
            fout << "\tslli t0, t0, 2" << std::endl;
            fout << "\tadd t0, t0, " << base_addr << std::endl;
            target_addr = "t0";
        }
        // 取出内存中的值
        if (is_globalvar(inst.op1.name)) // 从全局变量中取
        {
            fout << "\tlw " << rv::toString(getRd(inst.des)) << ", "
                 << "0(" << target_addr << ")" << std::endl;
        }
        else
        { // 如果target_addr是立即数，那么就不需要再load了
            if (target_addr[0] == 't')
                fout << "\tlw " << rv::toString(getRd(inst.des)) << ", "
                     << "0( " << target_addr << ")" << std::endl;
            else
                fout << "\tlw " << rv::toString(getRd(inst.des)) << ", " << target_addr << "(sp)" << std::endl;
        }
        // 将结果存回内存
        if (is_globalvar(inst.des.name))
            fout << "\tsw " << rv::toString(getRd(inst.des)) << ", " << inst.des.name << std::endl;
        else if (local_stack.find_operand(inst.des) != -1)
            fout << "\tsw " << rv::toString(getRd(inst.des)) << ", " << local_stack.find_operand(inst.des) << "(sp)" << std::endl;
        else if (inst.des.type != ir::Type::null && inst.des.type != ir::Type::IntLiteral)
        {
            local_stack.add_operand(inst.des, cur_ofs);
            fout << "\tsw " << rv::toString(getRd(inst.des)) << ", " << cur_ofs << "(sp)" << std::endl;
            cur_ofs += 4;
        }
        break;
    }
    case ir::Operator::store:
    {
        // sw rd, rs1, rs2
        std::string base_addr;
        if (is_globalvar(inst.op1.name))
        {
            // load 全局数组变量的地址
            fout << "\tla " + rv::toString(getRd(inst.des)) + ", " << inst.op1.name << std::endl;
            base_addr = rv::toString(getRd(inst.op1));
        }
        else
        {
            base_addr = std::to_string(local_stack.find_operand(inst.op1));
        }
        std::string target_addr = base_addr;
        if (inst.op2.type == ir::Type::IntLiteral)
        {
            if (is_globalvar(inst.op1.name))
                // 计算基址加偏移量
                fout << "\tadd " << rv::toString(getRd(inst.des)) << ", " << base_addr << ", " << std::stoi(inst.op2.name) * 4 << std::endl;
            else
                target_addr = std::to_string(std::stoi(inst.op2.name) * 4 + std::stoi(target_addr));
        }
        else
        {
            if (is_globalvar(inst.op2.name))
                fout << "\tlw t0, " << inst.op2.name << std::endl;
            else
                fout << "\tlw t0, " << local_stack.find_operand(inst.op2) << "(sp)" << std::endl;
            fout << "\tslli t0, t0, 2" << std::endl;
            fout << "\tadd t0, t0, " << base_addr << std::endl;
            target_addr = "t0";
        }
        if (is_globalvar(inst.des.name))
        {

            fout << "\tlw "
                 << "t1, 0(" << target_addr << ")" << std::endl;
            fout << "\tla " << rv::toString(getRd(inst.des)) << ", " << inst.des.name << std::endl;
            fout << "\tsw t1, 0(" << rv::toString(getRd(inst.des)) << ")" << std::endl;
        }
        else
        { // 将des表示的局部变量加载到寄存器中，再将其存回内存
            if (inst.des.type == ir::Type::IntLiteral)
                fout << "\tli " + rv::toString(getRd(inst.des)) + ", " << inst.des.name << std::endl;
            else
                fout << "\tlw " + rv::toString(getRd(inst.des)) + ", " << local_stack.find_operand(inst.des) << "(sp)" << std::endl;
            if (target_addr[0] == 't')
                fout << "\tsw " + rv::toString(getRd(inst.des)) + ", "
                     << "0(" << target_addr << ")" << std::endl;
            else
                fout << "\tsw " + rv::toString(getRd(inst.des)) + ", " << target_addr << "(sp)" << std::endl;
        }
        break;
    }
    case ir::Operator::eq:
    case ir::Operator::neq:
    case ir::Operator::lss:
    case ir::Operator::leq:
    case ir::Operator::gtr:
    case ir::Operator::geq:
    case ir::Operator::_not:
    {
        gen_logic_instr(inst);
        break;
    }
    case ir::Operator::_goto:
    {
        if (inst.op1.type == ir::Type::null) // 无条件跳转
        {
            // 跳转到对应的label
            fout << "\tj " << j_label[ir_idx + std::stoi(inst.des.name)] << std::endl;
        }
        else // 有条件跳转
        {
            if (inst.op1.type == ir::Type::IntLiteral)
                fout << "\tli t0, " << inst.op1.name << std::endl;
            else
            {
                if (is_globalvar(inst.op1.name))
                    fout << "\tlw t0, " << inst.op1.name << std::endl;
                else
                    fout << "\tlw t0, " << local_stack.find_operand(inst.op1) << "(sp)" << std::endl;
            }
            fout << "\tbnez t0, " << j_label[ir_idx + std::stoi(inst.des.name)] << std::endl;
        }
        break;
    }
    case ir::Operator::__unuse__:
    {
        fout << "\tnop" << std::endl;
        break;
    }
    default:
        assert(0 && "unknown instruction");
        break;
    }
}