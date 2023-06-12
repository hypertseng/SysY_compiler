#ifndef RV_DEF_H
#define RV_DEF_H

#include<string>

namespace rv {

// rv interger registers
enum class rvREG {
    /* Xn       its ABI name*/
    zero,         // zero
    ra,         // ra   Return address  (caller-saved)
    sp,         // sp   Stack pointer   (callee-saved)
    gp,         // gp   
    tp,         // tp   
    t0,         // t0   Temporary       (caller-saved)
    t1,         // t1   
    t2,         // t2   
    fp,         // s0/fp    Saved register/frame pointer  (callee-saved)
    s1,         // s1   Saved register  (callee-saved)
    a0,        // a0   Function argument/return value  (caller-saved)
    a1,        // a1   
    a2,        // a2
    a3,        // a3
    a4,        // a4
    a5,        // a5
    a6,        // a6
    a7,        // a7
    s2,        // s2   
    s3,        // s3
    s4,        // s4
    s5,        // s5
    s6,        // s6
    s7,        // s7
    s8,        // s8
    s9,        // s9
    s10,        // s10
    s11,        // s11
    t3,        // t3
    t4,        // t4
    t5,        // t5
    t6,        // t6
};
std::string toString(rvREG r); // implement this in ur own way

// enum class rvFREG {
//     F0,
//     F1,
//     F2,
//     F3,
//     F4,
//     F5,
//     F6,
//     F7,
//     F8,
//     F9,
//     F10,
//     F11,
//     F12,
//     F13,
//     F14,
//     F15,
//     F16,
//     F17,
//     F18,
//     F19,
//     F20,
//     F21,
//     F22,
//     F23,
//     F24,
//     F25,
//     F26,
//     F27,
//     F28,
//     F29,
//     F30,
//     F31,
// };
// std::string toString(rvFREG r);  // implement this in ur own way

// rv32i instructions
// add instruction u need here!
enum class rvOPCODE
{
    // RV32I Base Integer Instructions
    ADD,
    SUB,
    XOR,
    OR,
    AND,
    SLL,
    SRL,
    SRA,
    SLT,
    SLTU, // arithmetic & logic
    ADDI,
    XORI,
    ORI,
    ANDI,
    SLLI,
    SRLI,
    SRAI,
    SLTI,
    SLTIU, // immediate
    LW,
    SW, // load & store
    BEQ,
    BNE,
    BLT,
    BGE,
    BLTU,
    BGEU, // conditional branch
    JAL,
    JALR, // jump
    // RV32M Multiply Extension
    MUL,
    DIV,
    REM,
    // RV32F / D Floating-Point Extensions

    // Pseudo Instructions
    LA,
    LI,
    MV,
    J,
    BLE // ...
};
std::string toString(rvOPCODE r);  // implement this in ur own way


} // namespace rv



#endif