#ifndef RV_INST_IMPL_H
#define RV_INST_IMPL_H

#include "backend/rv_def.h"

namespace rv {

struct rv_inst {
    rvREG rd, rs1, rs2;         // operands of rv inst
    rvOPCODE op;                // opcode of rv inst
    
    uint32_t imm;               // optional, in immediate inst
    std::string label;          // optional, in beq/jarl inst

    // constructor
    // rv_inst(rvREG rd, rvREG rs1, rvREG rs2, rvOPCODE op);
    // std::string draw() const;
};

};

#endif