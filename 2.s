.data
vetor:  .word 200, 190, 340, 100 # exemplo

##### START MODIFIQUE AQUI START #####
#
# Este espaço é para você definir as suas constantes e vetores auxiliares.
#
##### END MODIFIQUE AQUI END #####
      
.text    

jal ra, main 
# Ao final do reajuste (aplica_reajuste) você deve retornar o programa para a próxima instrução abaixo, que consiste na correção/verificação.

##### START INSTRUÇÃO DE CORREÇÃO/VERIFICAÇÃO #####
# utilizado para correção (considerando um limiar de 200 para o vetor de exemplo após a aplicação do reajuste.

addi a4, x0, 3 # configurando a quantidade de salários acima do limiar de 200.
beq a4, t0, FIM # Verifica a quantidade de salários acima do limiar.

##### END INSTRUÇÃO DE CORREÇÃO/VERIFICAÇÃO #####

main: 
##### START MODIFIQUE AQUI START #####
    jal ra, aplica_reajuste 
##### END MODIFIQUE AQUI END #####

# dica, você deve salvar o endereço da primeira chamada (em stack (sp)) para depois recuperá-lo.

aplica_reajuste:
##### START MODIFIQUE AQUI START #####

##### END MODIFIQUE AQUI END #####

FIM: addi x0, x0, 1
