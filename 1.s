.data
vetor: .word 0 0 0 0

.text
la t2, vetor # endereço do vetor
li t3, 4 # tamanho do vetor

li a0, 0 # contador de pares
li a1, 0 # contador de ímpares

jal ra, contador
li t6, 10
beq x0, x0, FIM

contador:
    lw a2, 0(t2) # carrega o próximo elemento do vetor
    andi a3, a2, 1 # verifica o último bit para determinar se é par ou ímpar
    beqz a3, par # se for par, pula para PAR
    
    addi a1, a1, 1 # incrementa contador de ímpares
    j continuar

par: addi a0, a0, 1 # incrementa contador de pares

continuar:
    addi t2, t2, 4 # incrementa endereço do vetor
    addi t3, t3, -1 # decrementa tamanho do vetor
    
    bnez t3, contador # se tamanho do vetor for diferente de 0, continua a contagem

    jr ra

FIM: addi x0, x0, 1