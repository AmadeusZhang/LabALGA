// a0 <- x
// a1 <- exp

divp2:
    sra  t0, a0, a1      // t0 <- x >> exp
    bge  a0, zero, .end
    addi t1, zero, 1     // t1 <- 1
    sll  t1, t1, a1      // t1 <- 1 << exp
    addi t1, t1, -1      // t1 <- t1 - 1
    and  t1, a0, t1      // t1 <- x & ((1 << exp))
    beq  t1, zero, .end
    addi t0, t0, 1       // t0 <- res + 1
.end
    addi a0, t0, 0       // a0 <- res
    jalr zero, 0(ra)