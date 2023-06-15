#ifndef GENERARATOR_H
#define GENERARATOR_H

#include "ir/ir.h"
#include "backend/rv_def.h"
#include "backend/rv_inst_impl.h"

#include <map>
#include <string>
#include <vector>
#include <fstream>

namespace backend
{

    // it is a map bewteen variable and its mem addr, the mem addr of a local variable can be identified by ($sp + off)
    struct stackVarMap
    {
        std::map<std::string, int> _table;

        /**
         * @brief find the addr of a ir::Operand
         * @return the offset
         */
        int find_operand(ir::Operand);

        /**
         * @brief add a ir::Operand into current map, alloc space for this variable in memory
         * @param[in] size: the space needed(in byte)
         * @return the offset
         */
        int add_operand(ir::Operand, uint32_t size);
    };

    // 将所有参数载入结构，整体进行转递，避免参数过多问题
    struct Params
    {
        std::map<std::string, ir::Type> params_list;
    };

    struct Generator
    {
        const ir::Program &program;          // the program to gen
        std::ofstream &fout;                 // output file
        stackVarMap local_stack;             // map between local variable and its mem addr
        std::vector<std::string> global_var; // global variable
        int cur_ofs;                         // current offset of stack pointer
        std::map<int, std::string> j_label;  // map between label and ir in function
        int ir_idx;                          // current ir index
        Params params;                       // params list

        Generator(ir::Program &, std::ofstream &);

        // reg allocate api
        rv::rvREG getRd(ir::Operand);
        rv::rvREG getRs1(ir::Operand);
        rv::rvREG getRs2(ir::Operand);

        // generate wrapper function
        void gen();
        void gen_func(const ir::Function &);
        void gen_instr(const ir::Instruction &);
        void gen_global(const ir::Function &);
        void init_func(const ir::Function &);
        int alloc_stack(const ir::Function &);
        void clear_stack(const ir::Function &);
        bool is_globalvar(std::string);
        std::string get_realvar(std::string);
        void gen_operate_instr(const ir::Instruction &);
        void gen_call_instr(const ir::CallInst &);
        void gen_logic_instr(const ir::Instruction &);
    };

} // namespace backend

#endif