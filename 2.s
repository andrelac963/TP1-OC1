.data
vetor:  .word 200, 190, 340, 100 # exemplo

.text
la a0, vetor # endereço do vetor
li a1, 4 # tamanho do vetor
li a2, 200 # limiar
li t0, 0 # contador de salários acima do limiar
li t1, 2 # divisor para o reajuste

jal ra, main # chamando a sub-rotina main

addi a4, x0, 6 # configurando a quantidade de salários acima do limiar de 200.
beq a4, t0, FIM # Verifica a quantidade de salários acima do limiar.

main:
    addi sp, sp, -4 # alocando espaço na pilha
    sw ra, 0(sp) # salvando o endereço de retorno na pilha

    jal ra, aplica_reajuste # chamando a sub-rotina aplica_reajuste

    lw ra, 0(sp) # recuperando o endereço de retorno da pilha
    addi sp, sp, 4 # liberando espaço na pilha

    jr ra

aplica_reajuste:
    lw t2, 0(a0) # carregando o primeiro salário do vetor

    div t3, t2, t1 # dividindo o salário por 2
    add t2, t2, t3 # somando o salário com a metade do salário

    sw t2, -4(a0) # armazenando o novo salário de volta no vetor

    bge t2, a2, salario_acima_limiar # verifica se o salário é maior ou igual ao limiar

    addi a0, a0, 4 # incrementando endereço do vetor
    addi a1, a1, -1 # decrementando tamanho do vetor

    bnez a1, aplica_reajuste # verifica se o contador do tamanho do vetor é diferente de zero

    jr ra

salario_acima_limiar:
    addi t0, t0, 1 # incrementando contador de salários acima do limiar
    jr ra

FIM: addi x0, x0, 1