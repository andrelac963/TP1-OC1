.data
vetor: .word 0 0 0 0

la t2, vetor # endereço do vetor
li t3, 4 # tamanho do vetor

li a0, 0 # contador de pares
li a1, 0 # contador de ímpares

.text
jal ra, contador
addi a4, x0, 2 # utilizado para correção
beq a4, a0, FIM # Verifica # de pares
beq a4, a1, FIM # Verifica # de ímpares

contador: jalr x0, 0(ra)
    lw a2, 0(t2) #carrega o primeiro elemento do vetor
    rem a3, a2, a4 #verifica se é par ou ímpar
    beq a3, x0, PAR #se for par, pula para PAR
    addi a1, a1, 1 # incrementa contador de ímpares
    j CONTINUAR

PAR: addi a0, a0, 1

CONTINUAR: addi t2, t2, 4 # incrementa endereço do vetor
    addi t3, t3, -1 # decrementa tamanho do vetor
    beq t3, x0, FIM # verifica se chegou ao fim do vetor
    jal ra, contador

FIM: addi x0, x0, 1
