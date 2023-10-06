.data
vetor: .word 1 2 3 4

.text
la t2, vetor # endereço do vetor
li t3, 4 # tamanho do vetor

li a0, 0 # contador de pares
li a1, 0 # contador de ímpares

jal ra, contador
addi a4, x0, 2 # utilizado para correção
beq a4, a0, FIM # Verifica # de pares
beq a4, a1, FIM # Verifica # de ímpares

contador:
    lw a2, 0(t2) # carrega o próximo elemento do vetor
    andi a3, a2, 1 # verifica se o último bit é 1 (ímpar) ou 0 (par)
    beqz a3, PAR # se for par (último bit é 0), pula para PAR
    addi a1, a1, 1 # incrementa contador de ímpares
    j CONTINUAR

PAR: addi a0, a0, 1

CONTINUAR:
    addi t2, t2, 4 # incrementa endereço do vetor
    addi t3, t3, -1 # decrementa tamanho do vetor
    beqz t3, FIM # verifica se chegou ao fim do vetor (usando beqz)
    jal ra, contador

FIM: addi x0, x0, 1
