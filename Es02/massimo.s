// a0 <- a
// a1 <- n

massimo:
    // allocazione in memoria
    addi sp, sp, -24      
    sd   ra, 16(sp)

    // costruisco max
    addi t0, zero, 1
    slli t0, t0, 63
    sd   t0, 8(sp)

    // elemento 'i'
    addi t0, zero, 0
    sd   t0, 0(sp)

.start:
    ld   t0, 0(sp)      // non del tutto necessario
    bge  t0, a1, .end   // i < n 
    slli t0, t0, 3      // t0 <- i * 8
    add  t0, a0, t0     // t0 <- &a[i]
    ld   t0, 0(t0)      // t1 <- max
    bge  t1, t0, .continue
    sd   t0, 8(sp)      // max <- a[i]

.continue:
    ld   t0, 0(sp)      // t0 <- i
    addi t0, t0, 1      // t0 <- i + 1
    sd   t0, 0(sp)      // i <- i + 1
    beq  zero, zero, .start

.end:
    ld   a0, 8(sp)      // a0 <- max
    ld   ra, 16(sp)     // ra <- saved ra
    addi sp, sp, 24     // reset sp
    jalr zero, 0(ra)