.global swap_byte
swap_byte:

    srli t0, x10, 24        
    slli t1, x10, 24

    li t2, 0x00FFFF00
    and x10, x10, t2
    or x10, x10, t0
    or x10, x10, t1 
    
    ret

.global swap_content
swap_content:

    
    lw t0, 0(x10)       
    lw t1, 0(x11)       
    sw t1, 0(x10)       
    sw t0, 0(x11)       

    ret

.global reverse_endian
reverse_endian:

   
    lw t0, 0(x10)
    srli t1, t0, 24        
    slli t2, t0, 24
    srli t3, t0, 8
    slli t4, t0, 8
    li t5, 0x0000FF00       
    and t3, t3, t5
    li t5, 0x00FF0000
    and t4, t4, t5

    and t0, t0, x0


    or t0, t0, t1
    or t0, t0, t2
    or t0, t0, t3
    or t0, t0, t4

    sw t0, 0(x10)



    ret