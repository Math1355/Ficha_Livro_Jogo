algoritmo "Livro jogo"
var resp_jogar, Resp_iniciar, Modif, ResulAtri,QDados, RespD, Opcao,resulSorte, resp_equipa, espaco_equipa, resp_notas, espaco_nota: inteiro
    energia_Total, habilidade_Total, sorte_Total, medo_Max, energia_Atual, habilidade_Atual, sorte_Atual, medo_Atual: inteiro
    Habi_Inimigo, Energ_Inimigo, resp_combate, result_inimigo, result_personagem, resp_sorte_ataque, resp_sorte_defesa, continuar_combate, fugir, inim_derrotado: inteiro
    arma, continuar, gameover, novo_equipa, novo_nota: caractere
    Equipamentos: vetor[1..10] de caractere
    Notas: vetor[1..20] de caractere

    
//Primeira tela
Procedimento PrimeiraTela()
var
inicio
      Escreval("|-------------------------|")
      Escreval("|       LIVRO JOGO        |")
      Escreval("|-------------------------|")
      Escreval("Deseja Jogar Um Livro Jogo?")
      Escreval("1 - Sim")
      Escreval("2 - Não")
      Escreva("Resposta: ")
Fimprocedimento
//
//Segunda tela
Procedimento SegundaTela()
var
inicio
         Escreval("Rolando ",QDados, "d6 + 6 referente a sua habilidade...")
         Escreval("Resultado: ", habilidade_Total)
         Escreval("Rolando ",QDados, "d6 + 12 referente a sua energia...")
         Escreval("Resultado: ", energia_Total)
         Escreval("Rolando ",QDados, "d6 + 6 referente a sua sorte...")
         Escreval("Resultado: ", sorte_Total)
         Escreval("Vai continuar:")
         Escreval("1 - Sim")
         Escreval("2 - Não")
         Escreva("Resposta: ")
Fimprocedimento
//
//rolar atributos basicos
Procedimento Titulo()
var
inicio
      Escreval("|------------------------|")
      Escreval("| ROLADOR SEUS ATRIBUTOS |")
      Escreval("|------------------------|")
Fimprocedimento
Funcao calculoDe1Dados():inteiro
var C, Soma: Inteiro
Inicio
      Soma <- Soma + Modif
      Para C <- 1 ate QDados faca
              aleatorio 1, 6
              leia(RespD)
              LimpaTela
              aleatorio off
              Soma <- Soma + RespD
       FimPara
       Retorne Soma
Fimfuncao
//
//rolar sorte
Procedimento TituloSorte()
var
inicio
      Escreval("|------------------------|")
      Escreval("|    ROLADOR DE SORTE    |")
      Escreval("|------------------------|")
Fimprocedimento
Funcao calculoDeSortes():inteiro
var C, Sorte: Inteiro
Inicio
      Para C <- 1 ate QDados faca
              aleatorio 1, 6
              leia(RespD)
              LimpaTela
              aleatorio off
              Sorte <- Sorte + RespD
       FimPara
       Retorne Sorte
Fimfuncao
//
//rolar combate
Procedimento TituloCombate()
var
inicio
      Escreval("|-------------------------|")
      Escreval("|   ROLADOR DE COMBATE    |")
      Escreval("|-------------------------|")
Fimprocedimento
Funcao calculoDeCombate():inteiro
var C, Resultado: Inteiro
Inicio
      Para C <- 1 ate 2 faca
              aleatorio 1, 6
              leia(RespD)
              LimpaTela
              aleatorio off
              Resultado <- Resultado + RespD
       FimPara
       Retorne Resultado
Fimfuncao
//
inicio
      repita
      Limpatela
      PrimeiraTela()
      Leia(resp_jogar)
      Se resp_jogar = 1 entao
         // quantas vezes vai rolar os atributos

         QDados <- 1
         Modif <- 6
         ResulAtri <- calculoDe1Dados()
         habilidade_Total <- ResulAtri
         habilidade_Atual <- habilidade_Total - 3
         
         QDados <- 2
         Modif <- 12
         ResulAtri <- calculoDe1Dados()
         energia_Total <- ResulAtri
         energia_Atual <- energia_Total
         
         QDados <- 1
         Modif <- 6
         ResulAtri <- calculoDe1Dados()
         sorte_Total <- ResulAtri
         sorte_Atual <- sorte_Total
         
         QDados <- 1
         Modif <- 6
         ResulAtri <- calculoDe1Dados()
         medo_Max <- ResulAtri
         medo_Atual <- 0
         
         LimpaTela
         Titulo()
         SegundaTela()

         Leia(Resp_iniciar)
         inim_derrotado <- 0
// Controle de ficha
            Se Resp_iniciar = 1 entao
               Repita
               LimpaTela
               Escreval("|-----------------|----------------|------------------|")
               Escreval("|Habilidade       |Energia         |Sorte             |")
               Escreval("|Inicial: ", habilidade_Total,"     |Inicial:", energia_Total,"     |Inicial: ",sorte_Total,"       |")
               Escreval("|Atual: ",habilidade_Atual,"        |Atual: ",energia_Atual,"      |Atual: ",sorte_Atual,"        |") //atributos atuais que vão mudar
               Escreval("|-----------------|----------------|------------------|")
               Escreval(" Arma: ",arma)
               Escreval("|-----------------|----------------|------------------|")
               Escreval("|Medo                              |Equipamento       |")  //Equipamentos que vão ser encontrados que podem ser alterado
               Escreval("|Medo Maximo: ",medo_Max,                   "                   |1 -  ",Equipamentos[1]) //Rolar depois e o valor vai aparecer aqui
               Escreval("|Medo atual: ",medo_Atual,                      "                    |2 -  ",Equipamentos[2]) //Medo atual
               Escreval("|                                  |3  - ",Equipamentos[3])
               Escreval("|                                  |4  - ",Equipamentos[4])
               Escreval("|                                  |5  - ",Equipamentos[5])
               Escreval("|                                  |6  - ",Equipamentos[6])
               Escreval("|                                  |7  - ",Equipamentos[7])
               Escreval("|                                  |8  - ",Equipamentos[8])
               Escreval("|                                  |9  - ",Equipamentos[9])
               Escreval("|                                  |10 - ",Equipamentos[10])
               Escreval("|----------------------------------|------------------|")
               Escreval("|Monstros derrotados: ",inim_derrotado,              "           |Notas             |") //Notas que podem ajudar conforme jogar
               Escreval("|                                  |1 -  ", Notas[1]) //informações de monstros derrotados
               Escreval("|                                  |2 -  ", Notas[2])
               Escreval("|                                  |3 -  ", Notas[3])
               Escreval("|                                  |4 -  ", Notas[4])
               Escreval("|                                  |5 -  ", Notas[5])
               Escreval("|                                  |6 -  ", Notas[6])
               Escreval("|                                  |7 -  ", Notas[7])
               Escreval("|                                  |8 -  ", Notas[8])
               Escreval("|                                  |9 -  ", Notas[9])
               Escreval("|                                  |10 - ", Notas[10])
               Escreval("|                                  |11 - ", Notas[11])
               Escreval("|                                  |12 - ", Notas[12])
               Escreval("|                                  |13 - ", Notas[13])
               Escreval("|                                  |14 - ", Notas[14])
               Escreval("|                                  |15 - ", Notas[15])
               Escreval("|                                  |16 - ", Notas[16])
               Escreval("|                                  |17 - ", Notas[17])
               Escreval("|                                  |18 - ", Notas[18])
               Escreval("|                                  |19 - ", Notas[19])
               Escreval("|                                  |20 - ", Notas[20])
               Escreval("|----------------------------------|------------------|")
               Escreval("|Opções:")

               Escreval("|1  - Alterar habilidade atual")
               // vai alterar a habilidade atual

               Escreval("|2  - Adicionar / Alterar arma")
               // vai adicionar ou alterar a sua arma atual

               Escreval("|3  - Alterar energia atual")
               // vai alterar a energia atual, caso chegue a zero perde - Vai apresentar " Game over " e a opção de voltar para o menu, voltando para o primeira tela.

               Escreval("|4  - Alterar sorte atual")
               // vai alterar a sua sorte atual

               Escreval("|5  - Rolar sorte")
               // rolar dois dados, se for menor que a sorte atual e sucesso

               Escreval("|6  - Alterar medo atual")
               // altera o valor do seu medo

               Escreval("|7  - Adicionar / Alterar equipamentos")
               //vai abrir e mostrar seus equipamentos e vai perguntar se quer:
               //1 - adicionar  vai adicionar mais um novo equipamento
               //2 - alterar  vai perguntar qual dos equipamentos deseja alterar.
               //2.1 - selecione qual deseja alterar e altere

               Escreval("|8  - Adicionar / Alterar notas")
               //1 - adicionar vai adicionar uma nova nota
               //2 - alterar se vai querer alterar uma das notas
               //2.1 - selecione qual deseja alterar e altere

               Escreval("|9 - Batalha")
               // adicione a habilidade e energia do monstro.
               //1 - mostre sua habilidade, energia e sorte X a do monstro, e de as seguintes opções:
               //1.1 - Lutar você vai rolar os seus dados e do inimigo, assim vai comparar quem vai ganhar e mostrar quem venceu a rodada e
               //vai apresentar a seguinte opção (diminuindo automática 2 pontos de energia):
               //1.2 - Deseja usar sorte para atacar? S/N Se sim para um sucesso no seu ataque role sorte, se passar de mais 2 pontos de dano, ser não, causa so 1 de dano.
               //1.2.1 - Deseja usar sorte para defender? S/N  Se sim para um sucesso inimigo role sorte, se passar no teste de sorte o dano inimigo e
               //somente 1, se fracassar sofre mais 1 de dano.
               //2 - Fugir  você vai perde automática 2 pontos da sua energia atual.

               Escreval("|10 - Fim de jogo")
               //Vai apresentar " Game over " e a opção de voltar para o menu, voltando para o primeira tela.
               
               Escreva("Resposta: ")
               Leia (Opcao)
               Escolha Opcao

               Caso 1
               // vai alterar a habilidade atual
                    Limpatela
                    Escreval("Insira o novo valor da habilidade: ")
                    Escreva("Resposta: ")
                    Leia (habilidade_Atual)
               Caso 2
               // vai adicionar ou alterar a sua arma atual
                    Limpatela
                    Escreval("Insira a arma: ")
                    Escreva("Resposta: ")
                    Leia (arma)
               Caso 3
               // vai alterar a energia atual, caso chegue a zero perde - Vai apresentar " Game over " e a opção de voltar para o menu, voltando para o primeira tela.
                    Limpatela
                    Escreval("Insira o novo valor da energia: ")
                    Escreva("Resposta: ")
                    Leia (energia_Atual)
                    Se energia_Atual <= 0 entao
                       energia_Atual <- 0
                    FimSE
               Caso 4
               // vai alterar a sua sorte atual
                    Limpatela
                    Escreval("Insira o novo valor da sorte: ")
                    Escreva("Resposta: ")
                    Leia (sorte_Atual)
               Caso 5
               // rolar dois dados, se for menor que a sorte atual e sucesso
                    repita
                          QDados <- 2
                          resulSorte <- calculoDeSortes()
                                     Se resulSorte <= sorte_Atual entao
                                        sorte_Atual <- sorte_Atual - 1
                                        Limpatela
                                        TituloSorte()
                                        Escreval("PARABENS VOCÊ FOI SORTUDO!")
                                     Senao
                                        sorte_Atual <- sorte_Atual - 1
                                        Limpatela
                                        TituloSorte()
                                        Escreval("INFELIZMENTE VOCÊ FOI AZARADO...")
                                     FimSE
                          Escreval("Continuar [S/N]")
                          Escreva("Resposta: ")
                          Leia(continuar)
                    Ate continuar = "n"
               Caso 6
               // altera o valor do seu medo
                    Limpatela
                    Escreval("Insira o novo valor do seu medo: ")
                    Escreva("Resposta: ")
                    Leia (medo_Atual)
               Caso 7
               //vai abrir e mostrar seus equipamentos e vai perguntar se quer:
               //1 - adicionar  vai adicionar mais um novo equipamento
               //2 - alterar  vai perguntar qual dos equipamentos deseja alterar.
               //2.1 - selecione qual deseja alterar e altere
                    Repita
                    Limpatela
                    Escreval("|------------------------------------|")
                    Escreval("|Equipamento")
                    Escreval("|1  - ", Equipamentos[1])
                    Escreval("|2  - ", Equipamentos[2])
                    Escreval("|3  - ", Equipamentos[3])
                    Escreval("|4  - ", Equipamentos[4])
                    Escreval("|5  - ", Equipamentos[5])
                    Escreval("|6  - ", Equipamentos[6])
                    Escreval("|7  - ", Equipamentos[7])
                    Escreval("|8  - ", Equipamentos[8])
                    Escreval("|9  - ", Equipamentos[9])
                    Escreval("|10 - ", Equipamentos[10])
                    Escreval("|------------------------------------|")
                    Escreval("|O que deseja fazer: ")
                    Escreval("|1 - Adicionar ")
                    Escreval("|2 - Alterar ")
                    Escreval("|3 - Sair ")
                    Escreva("|Resposta: ")
                    Leia(resp_equipa)
                    Escolha resp_equipa
                    Caso 1
                       Escreva("Qual o novo equipamento: ")
                       Leia(novo_equipa)
                       Escreva("Qual espaço deseja colocar o item [1 a 10]: ")
                       Leia(espaco_equipa)
                       Enquanto Equipamentos[espaco_equipa] <> "" faca
                                Escreva("Espaço indisponivel, por favor escolha outro: ")
                                Leia(espaco_equipa)
                       fimenquanto
                       Equipamentos[espaco_equipa] <- novo_equipa
                    Caso 2
                       Escreva("Qual equipamento deseja alterar[1 a 10]: ")
                       Leia(espaco_equipa)
                       Enquanto Equipamentos[espaco_equipa] = "" faca
                                Escreva("Espaço indisponivel, por favor escolha um que tenha equipamento: ")
                                Leia(espaco_equipa)
                       fimenquanto
                       Escreva("Qual e o novo equipamento: ")
                       Leia(novo_equipa)
                       Equipamentos[espaco_equipa] <- novo_equipa
                    Caso 3
                         resp_equipa <- 0

                    Outrocaso
                       Escreva("Valor invalido")
                       
                    Fimescolha
                    Ate resp_equipa = 0
               Caso 8
               //1 - adicionar vai adicionar uma nova nota
               //2 - alterar se vai querer alterar uma das notas
               //2.1 - selecione qual deseja alterar e altere
                    Repita
                    Limpatela
                    Escreval("|------------------------------------|")
                    Escreval("|Notas                               |")
                    Escreval("|1  - ",Notas[1])
                    Escreval("|2  - ",Notas[2])
                    Escreval("|3  - ",Notas[3])
                    Escreval("|4  - ",Notas[4])
                    Escreval("|5  - ",Notas[5])
                    Escreval("|6  - ",Notas[6])
                    Escreval("|7  - ",Notas[7])
                    Escreval("|8  - ",Notas[8])
                    Escreval("|9  - ",Notas[9])
                    Escreval("|10 - ",Notas[10])
                    Escreval("|11 - ",Notas[11])
                    Escreval("|12 - ",Notas[12])
                    Escreval("|13 - ",Notas[13])
                    Escreval("|14 - ",Notas[14])
                    Escreval("|15 - ",Notas[15])
                    Escreval("|16 - ",Notas[16])
                    Escreval("|17 - ",Notas[17])
                    Escreval("|18 - ",Notas[18])
                    Escreval("|19 - ",Notas[19])
                    Escreval("|20 - ",Notas[20])
                    Escreval("|------------------------------------|")
                    Escreval("|O que deseja fazer: ")
                    Escreval("|1 - Adicionar ")
                    Escreval("|2 - Alterar ")
                    Escreval("|3 - Sair ")
                    Escreva("|Resposta: ")
                    Leia(resp_notas)
                    Escolha resp_notas
                    Caso 1
                       Escreva("Qual o nova nota: ")
                       Leia(novo_nota)
                       Escreva("Qual espaço deseja colocar a nota [1 a 20]: ")
                       Leia(espaco_nota)
                       Enquanto Notas[espaco_nota] <> "" faca
                                Escreva("Espaço indisponivel, por favor escolha outro: ")
                                Leia(espaco_nota)
                       fimenquanto
                       Notas[espaco_nota] <- novo_nota
                    Caso 2
                       Escreva("Qual nota deseja alterar[1 a 20]: ")
                       Leia(espaco_nota)
                       Enquanto Notas[espaco_nota] = "" faca
                                Escreva("Espaço indisponivel, por favor escolha um que tenha nota: ")
                                Leia(espaco_nota)
                       fimenquanto
                       Escreva("Qual e o nova nota: ")
                       Leia(novo_nota)
                       Notas[espaco_nota] <- novo_nota
                    Caso 3
                         resp_notas <- 0

                    Outrocaso
                       Escreva("Valor invalido")

                    Fimescolha
                    Ate resp_notas = 0
                    
               Caso 9
               // adicione a habilidade e energia do monstro.
               //1 - mostre sua habilidade, energia e sorte X a do monstro, e de as seguintes opções:
               //1.1 - Lutar você vai rolar os seus dados e do inimigo, assim vai comparar quem vai ganhar e mostrar quem venceu a rodada e
               //vai apresentar a seguinte opção (diminuindo automática 2 pontos de energia):
               //1.2 - Deseja usar sorte para atacar? S/N Se sim para um sucesso no seu ataque role sorte, se passar de mais 2 pontos de dano, ser não, causa so 1 de dano.
               //1.2.1 - Deseja usar sorte para defender? S/N  Se sim para um sucesso inimigo role sorte, se passar no teste de sorte o dano inimigo e
               //somente 1, se fracassar sofre mais 1 de dano.
               //2 - Fugir  você vai perde automática 2 pontos da sua energia atual.
                    Limpatela
                    continuar_combate <- 2
                    Escreva("Adicione a Habilidade do Inimigo: ")
                    Leia(Habi_Inimigo)
                    Escreva("Adicione a energia do Inimigo: ")
                    Leia(Energ_Inimigo)
                    Repita
                    Limpatela
                    Escreval("-----------------------------------------")
                    Escreval("VOCÊ                X     INIMIGO")
                    Escreval("Habilidade: ",habilidade_Atual,"     X     Habilidade: ",Habi_Inimigo)
                    Escreval("Energia: ",energia_Atual,"        X     Energia: ",Energ_Inimigo)
                    Escreval("Sorte: ",sorte_Atual)
                    Escreval("-----------------------------------------")
                    Escreval("O que deseja fazer: ")
                    Escreval("1 - Lutar ")
                    Escreval("2 - Fugir ")
                    Escreva("|Resposta: ")
                    Leia(resp_combate)
                    Escolha resp_combate
                    Caso 1
                         Limpatela
                         result_personagem <- calculoDeCombate()
                         result_inimigo <- calculoDeCombate()
                         result_personagem <- result_personagem + habilidade_Atual
                         result_inimigo <- result_inimigo + Habi_Inimigo
                         TituloCombate()
                         Escreval("Seu valor de força foi: ",result_personagem)
                         Escreval("O valor de força do inimigo foi: ",result_inimigo)
                         Se result_personagem > result_inimigo entao
                            Energ_Inimigo <- Energ_Inimigo - 2
                            Escreval("VOCÊ ACERTOU O ATAQUE!")
                            Escreval("--------------------------")
                            Escreval("Deseja usar sorte: ")
                            Escreval("1 - Sim")
                            Escreval("2 - Não")
                            Escreva("Resposta: ")
                            Leia(resp_sorte_ataque)
                            Escolha resp_sorte_ataque
                                    Caso 1
                                         QDados <- 2
                                         resulSorte <- calculoDeSortes()
                                              Se resulSorte <= sorte_Atual entao
                                                 sorte_Atual <- sorte_Atual - 1
                                                 Escreval("|-------------------------|")
                                                 Escreval("|         SORTUDO!        |")
                                                 Escreval("|-------------------------|")
                                                 Escreval("SEU VALOR DE SORTE FOI: ", resulSorte)
                                                 Escreval("PARABENS VOCÊ FOI SORTUDO!")
                                                 Escreval("VOCÊ CAUSOU MAIS DANO!")
                                                                enquanto continuar_combate <> 1 faca
                                                                         Escreval("Continuar:")
                                                                         Escreval("1 - Sim")
                                                                         Escreval("2 - Não")
                                                                         Escreva("Resposta: ")
                                                                         Leia(continuar_combate)
                                                                fimenquanto
                                                 Energ_Inimigo <- Energ_Inimigo - 2
                                              Senao
                                              sorte_Atual <- sorte_Atual - 1
                                              Escreval("|-------------------------|")
                                              Escreval("|         AZARADO!        |")
                                              Escreval("|-------------------------|")
                                              Escreval("SEU VALOR DE SORTE FOI: ", resulSorte)
                                              Escreval("INFELIZMENTE VOCÊ FOI AZARADO...")
                                              Escreval("VOCÊ CAUSOU MENOS DANO!")
                                                             enquanto continuar_combate <> 1 faca
                                                                         Escreval("Continuar:")
                                                                         Escreval("1 - Sim")
                                                                         Escreval("2 - Não")
                                                                         Escreva("Resposta: ")
                                                                         Leia(continuar_combate)
                                                             fimenquanto
                                              Energ_Inimigo <- Energ_Inimigo + 1
                                              FimSE
                                         resp_sorte_ataque <- 0
                                    Caso 2
                                         resp_sorte_ataque <- 0
                                    Fimescolha
                         FimSE
                         Se result_personagem < result_inimigo entao
                            energia_Atual <- energia_Atual - 2
                            Escreval("O INIMIGO ACERTOU O ATAQUE!")
                            Escreval("--------------------------")
                            Escreval("Deseja usar sorte: ")
                            Escreval("1 - Sim")
                            Escreval("2 - Não")
                            Escreva("Resposta: ")
                            Leia(resp_sorte_defesa)
                            Escolha resp_sorte_defesa
                               Caso 1
                                 QDados <- 2
                                 resulSorte <- calculoDeSortes()
                                     Se resulSorte <= sorte_Atual entao
                                        sorte_Atual <- sorte_Atual - 1
                                        Escreval("|-------------------------|")
                                        Escreval("|         SORTUDO!        |")
                                        Escreval("|-------------------------|")
                                        Escreval("SEU VALOR DE SORTE FOI: ", resulSorte)
                                        Escreval("PARABENS VOCÊ FOI SORTUDO!")
                                        Escreval("VOCÊ SOFREU MENOS DANO!")
                                                       enquanto continuar_combate <> 1 faca
                                                                         Escreval("Continuar:")
                                                                         Escreval("1 - Sim")
                                                                         Escreval("2 - Não")
                                                                         Escreva("Resposta: ")
                                                                         Leia(continuar_combate)
                                                       fimenquanto
                                        energia_Atual <- energia_Atual + 1
                                     Senao
                                        sorte_Atual <- sorte_Atual - 1
                                        Escreval("|-------------------------|")
                                        Escreval("|         AZARADO!        |")
                                        Escreval("|-------------------------|")
                                        Escreval("SEU VALOR DE SORTE FOI: ", resulSorte)
                                        Escreval("INFELIZMENTE VOCÊ FOI AZARADO...")
                                        Escreval("VOCÊ SOFREU MAIS DANO!")
                                                       enquanto continuar_combate <> 1 faca
                                                                         Escreval("Continuar:")
                                                                         Escreval("1 - Sim")
                                                                         Escreval("2 - Não")
                                                                         Escreva("Resposta: ")
                                                                         Leia(continuar_combate)
                                                       fimenquanto
                                        energia_Atual <- energia_Atual - 1
                                     FimSE
                               Caso 2
                                    resp_sorte_defesa <- 0
                               Fimescolha
                         FimSE
                         Se result_personagem = result_inimigo entao
                            Escreval("|-------------------------|")
                            Escreval("|          EMPATE!        |")
                            Escreval("|-------------------------|")
                            enquanto continuar_combate <> 1 faca
                                     Escreval("Continuar:")
                                     Escreval("1 - Sim")
                                     Escreval("2 - Não")
                                     Escreva("Resposta: ")
                                     Leia(continuar_combate)
                            fimenquanto
                         FimSE

                    Caso 2
                         fugir <- 1
                         energia_Atual <- energia_Atual - 2

                    Outrocaso
                    Escreva("Valor invalido")
                    
                    Fimescolha
                    Se Energ_Inimigo <= 0 entao
                       inim_derrotado <- inim_derrotado + 1
                    FimSE
                    Ate (energia_Atual <= 0) ou (Energ_Inimigo <= 0) ou (fugir = 1)

                    
               Caso 10
               //Vai apresentar " Game over " e a opção de voltar para o menu, voltando para o primeira tela.
                    energia_Atual <- 0
               Outrocaso
                    Escreva("Valor invalido")
               Fimescolha
               
               Ate (energia_Atual <= 0) ou (medo_Atual >= medo_Max)
            FimSE
      FimSE
      Limpatela
      Escreval("|-------------------------|")
      Escreval("|       FIM DE JOGO       |")
      Escreval("|-------------------------|")
      Escreval("Deseja jogar novamente? [S/N]")
      Escreva("Resposta: ")
      Leia(gameover)
      Ate gameover = "n"
fimalgoritmo
