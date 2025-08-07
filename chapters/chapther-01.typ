#import "../styles.typ": *

= Sistemas de Equações Lineares e Matrizes



== Introdução aos sistemas de equações lineares 

#set heading(numbering: none)
=== Conjunto de exercícios 1.1 (página 9)

+ Em cada parte, determine se a equação é linear em $x_1$, $x_2$ e $x_3$.
  #set enum(numbering: "(a)")
  + $x_1 + 5x_2 - sqrt(2) x_3 = 1$
  + $x_1 + 3x_2^2 + x_1 x_3$
  + $x_1 = -7x_2 + 3x_3$
  + $x_1^(-2) + x_2 + 8x_3$
  + $x_1^(3/5) - 2x_2 + x_3 = 4$
  + $pi x_1 - sqrt(2) x_2 + 1/3 x_ 3 = 7^(1/3)$

  #solution([
    São lineares as equações (a), (c) e (f).
  ])
+ Em cada parte, determine se as equações formam um sistema linear.
  #set enum(numbering: "(a)")
  + $
      -2x + 4y + z &= 2\
      3x - 2/y &= 0
    $

  + $
      x &= 4\
      2x &= 8
    $

  + $
      4&x - &y + 2&z &= -1\
      -&x + (ln 2) &y - 3&z &= 0
    $

  + $
      3z + x &= -4\
      y + 5z &= 1\
      6x + 2z &= 3\
      -x - y - z = 4
    $

  #solution([
    São lineares as equações que formam os sistemas (b), (c) e (d).
  ])

+ Em cada parte, determine se as equações formam um sistema linear.
  #set enum(numbering: "(a)")
  + $
      2&x_1     &       & -   &x_4 &= 5\
      -&x_1 + 4 &x_2 + 3&x_3-2&x_4 &= -1
    $

  + $
      sin(2x_1 + x_3) &= sqrt(5)\
      e^(-2x_2 - 2x_4) &= 1/x_2\
      4x+4 &= 4
    $ 

  + $
    7&x_1 -   &x_2 +  2 &x_3  &= 0\
    2&x_1 +   &x_2 - x_3&x_4  &= 3\
    -&x_1 +  5&x_2 -    &x_4  &= -1
    $

  + $x_1 + x_2 = x_3 + x_4$

  #solution([
    São lineares as equações que formam os sistemas em (a) e (d).
  ])

+ Para cada sistema do Exercício 2 que for linear, detemine se é consistente.
  #set enum(numbering: "(a)", start: 2)
  + $
      x &= 4\
      2x &= 8
    $

  #solution([
    No sistema dado, consideremos a segunda equação: $2x = 8$. Dividindo-a por $2$, obtemos $x = 4$, que é exatamente a primeira equação. Assim, o sistema possui uma solução: $x = 4$ e é *consistente*.
  ])

  + $
      4&x - &y + 2&z &= -1\
      -&x + (ln 2) &y - 3&z &= 0
    $

  #solution([
    Temos duas equações e três incógnitas. Geometricamente, representam dois planos no espaço tridimensional ($RR^3$). Inicialmente, vamos eliminar $x$ da primeira equação somando 4 vezes a segunda equação à primeira. O sistema simplificado é mostrado abaixo:

    $
       & &(4ln 2-1) &y -10  &z &= -1\
      -&x + &(ln 2)  &y - 3&z &= 0
    $

    Arbitrariamente, parametrizemos $y = t$. Assim, a primeira equação assume a forma:
    $
      (4 ln 2 - 1) y -10z = -1 &arrow.double (4 ln 2 - 1)t - 10z = -1\
      &arrow.double z = frac(1 + (1 - 4ln 2)t, 10)
    $

    Substituindo as expressões parametrizadas de $y$ e $z$ na segunda equação, obtemos:
    $
      -x + (ln 2)y - 3z = 0 &arrow.double x = (ln 2)y - 3z\
      &arrow.double x = (ln 2) t - 3 dot frac(1 + (1 - 4ln 2)t, 10)\
      &arrow.double x = frac((10ln 2)t - 3 - (1 + 4ln 2)t, 10)\
      &arrow.double x = frac((6ln 2 - 1)t - 3, 10)
    $
    A solução do sistema é
    $
      cases(
        x = display(frac((6ln 2 - 1)t - 3, 10))\
        y = t\
        z = display(frac(1 + (1 - 4ln 2)t, 10))
      ) 
    $
    para $t in RR$. Em particular, tomando $t = 0$, encontramos a solução $(x, y, z) = (display(-3/10), 0, display(1/10))$.

    Portanto, o sistema possui infinitas soluções e é *consistente*.
    
  ])

  + $
      3z + x &= -4\
      y + 5z &= 1\
      6x + 2z &= 3\
      -x - y - z &= 4
    $

  #solution([
    A matriz aumentada representativa do sistema dado é a seguinte:

    #set math.mat(align: right, delim: "[")
    $
      mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        6, 0, 2, 3;
        -1, -1, -1, 4
      )
    $


    No que segue, consideremos a seguinte notação, representativa das operações elementares sobre matrizes:
    - $L_m$: Representa a linha $m$, com $m = 1, 2, 3, 4$;
    - $L_m arrow.l.r L_n$: As linhas $m$ e $n$ trocam de lugar, com $m, n = 1, 2, 3, 4$;
    - $L_m arrow a L_m + b L_n$: A linha $m$ é substituída por $a$ vezes a linha $m$ somado a $b$ vezes a linha $n$, em que $a$ e $b$. 

    Assim, façamos as seguinte manipulações sobre a matriz aumentada:
    $
      & & &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        6, 0, 2, 3;
        -1, -1, -1, 4
      )\
      &(L_3 arrow 6L_1 - L_3) &arrow.double &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        0, 0, 14, -21;
        -1, -1, -1, 4
      )\
      &(L_3 arrow L_3/7)  &arrow.double &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        0, 0, 1, -3/2;
        -1, -1, -1, 4       
      )\
      &(L_4 arrow L_1 + L_2 + L_4) &arrow.double &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        0, 0, 1, -3/2;
        0, 0, 7, 1       
      )\
      &(L_4 arrow L_4/7) &arrow.double &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        0, 0, 1, -3/2;
        0, 0, 1, 1/7         
      ) 
    $

    Note que as linhas 3 e 4 acima equivalem às equações $z = -3/2$ e $z = 1/7$, respectivamente. Isso representa uma contradição. Portanto, o sistema não possui solução e é *inconsistente*.
  ])

+ Para cada sistema do Exercício 3 que for linear, determine se é consistente.

  #set enum(numbering: "(a)")
  + $
      2&x_1     &       & -   &x_4 &= 5\
      -&x_1 + 4 &x_2 + 3&x_3-2&x_4 &= -1
    $

  #solution([
    Parametrizemos:
    $
      cases(
        x_1 &= r\
        x_2 &= s
      )
    $
    Então,
    $
      cases(
      2&x_1     &       & -   &x_4 &= 5\
      -&x_1 + 4 &x_2 + 3&x_3-2&x_4 &= -1
      )
      &arrow.double 
      cases(
      2&r     &       & -   &x_4 &= 5\
      -&r + 4 &s + 3&x_3-2&x_4 &= -1
      )\
      &arrow.double 
      cases(
        x_4 &= 2r - 5\
        x_3 &= display(frac(-1 + r - 4s + 2x_4, 3))
      )\
      &arrow.double 
      cases(
        x_4 &= 2r - 5\
        x_3 &= display(frac(-1 + r - 4s + 2 dot (2r - 5), 3))
      )\
      &arrow.double
      cases(
        x_4 &= 2r - 5\
        x_3 &= display(frac(-11 + 5r - 4s, 3))
      )
    $
    Portanto, o sistema possui infintas soluções da forma:
    $
      cases(
        x_1 &= r\
        x_2 &= s\
        x_3 &= display(frac(-11 + 5r - 4s, 3))\
        x_4 &= 2r - 5
      )
    $
    Em particular,  tomando $r = s = 0$, obtemos a solução $(0, 0, -11/3, 5)$.
  ])


  #set enum(start: 4)
  + $x_1 + x_2 = x_3 + x_4$
  #solution([
    Parametrizemos:
    $
      cases(
        x_1 &= r\
        x_2 &= s\
        x_3 &= t
      ) 
    $
    Portanto,
    $
      x_1 + x_2 = x_3 + x_4 arrow.double r + s = t + x_4 arrow.double x_4 = r+ s - t
    $
    O sistema possui infinitas soluções da forma:
    $
      cases(
        x_1 &= r\
        x_2 &= s\
        x_3 &= t\
        x_4 &= r+s-t
      )
    $
    Em particular, tomando $r = s = t = 0$, obtemos a solução trivial $(0,0,0,0)$.
  ])

+ Escreva um sistema de equações lineares constituído de trẽs equações em três incógnitas com 

  #set enum(numbering: "(a)")
  + nenhuma solução
    #solution([
      $
        cases(
          &x + &y + &z &= 1 \
          &x - &y - 2&z &= 2 \
          &x + &y + &z &= 0
        )
      $
    ])
  + exatamente uma solução
    #solution([
      $
        cases(
          &x + &y &- z &= &2\
          &  &y &+ z &= -&1\
          &x - &y &+ z &= &0
        )
      $
    ])
  + uma infinidade de soluções
    #solution([
      $
        cases(
          &x + &y &+ z &= &1\
          &x & &-z &= &5\
          2&x + &y & &= &6
        )
      $
    ])
  
+ Em cada parte, determine se o terno ordenado é uma solução do sistema linear

  $
    cases(
      2x_1 &- 4x_2 &- x_3 &= 1\
      x_1 &- 3x_2 &+ x_3 &= 1\
      3x_1 &- 5x_2 &- 3x_3 &= 1
    )
  $

    #set enum(numbering: "(a)")
  + $(3, 1, 1)$
    #solution([
      Substituindo o terno ordenado $(3, 1, 1)$ na primeira equação, temos:
      $
        2x_1 - 4x_2 - x_3 = 1 &arrow.double 2 dot 3 &- 4 dot 1 - 1  &= 1\
                              &arrow.double &6 - 4 - 1 &= 1\
                              &arrow.double &1 &= 1 
      $
      Substituindo na segunda equação:
      $
        x_1 - 3x_2 + x_3 = 1 &arrow.double &3 - 3 dot 1 + 1 & = 1 \
                             &arrow.double &3 - 3 - 1 & = 1\
                             &arrow.double &1 & = 1
      $

      Substituindo na terceira equação:
      $
        3x_1 - 5x_2 - 3x_3 = 1 &arrow.double &3 dot 3 - 5 dot 1 - 3 dot 1 &= 1\
                               &arrow.double &9 - 5 - 3 & = 1\
                               &arrow.double & 1 & = 1
      $

      Logo, o terno $(3, 1, 1)$ é solução do sistema de equações.
    ])
  + $(3, -1, 1)$
    #solution([
      Substituindo o terno na primeira equação, temos:
      $
        2x_1 - 4x_2 - x_3 = 1 &arrow.double &2 dot 3 - 4 dot (-1) - 1 &= 1\
                              &arrow.double &6 + 4 - 1 &= 1\
                              &arrow.double &9 &= 1 ("inválido")
      $
      Como o terno ordenado não é solução da primeira equação, também não será solução do sistema.
    ])
  + $(13, 5, 2)$
    #solution([
      Substituindo o terno na primeira equação, temos:
      $
        2x_1 - 4x_2 - x_3 = 1 &arrow.double &2 dot 13 - 4 dot 5 - 2 &= 1\
                              &arrow.double &26 - 20 -2 &= 1\
                              &arrow.double &4 &= 1 quad ("inválido")
      $
      Como o terno ordenado não é solução da primeira equação, também não será solução do sistema.
    ])
  + $(13/2, 5/2, 2)$
    #solution([
      Substituindo o terno na primeira equação, temos:
      $
        2x_1 - 4x_2 - x_3 = 1 &arrow.double &2 dot 13/2 - 4 dot 5/2 - 2 &= 1\
                              &arrow.double &13 -10 - 2 &= 1\
                              &arrow.double &1 &= 1

      $
      Substituindo o terno na segunda equação, temos:
      $
        x_1 - 3x_2 + x_3 = 1 &arrow.double & 13/2 - 3 dot 5/2 + 2 &= 1\
                             &arrow.double &13/2 - 15/2 + 2 & = 1\
                             &arrow.double &-1 + 2 &= 1\
                             &arrow.double &1 & = 1 
      $ 
      Substituindo o terno na terceira equação, temos:  
      $
        3x_1 - 5x_2 - 3x_2 = 1 &arrow.double & 3 dot 13/2 - 5 dot 5/2 - 3 dot 2 & = 1\
                               &arrow.double &39/2 - 25/2 - 6 &= 1\
                               &arrow.double &14/2 - 6 & = 1\
                               &arrow.double & 1 & = 1
      $
      Logo, o terno $(13/2, 5/2, 2)$ é solução do sistema de equações.
    ])
  + $(17, 7, 5)$
    #solution([
      Substituindo o terno ordenado na primeira equação:
      $
        2x_1 - 4x_2 - x_2 = 1 &arrow.double &2 dot 17 - 4 dot 7 - 5 & = 1\
                              &arrow.double &34 - 28 - 5 &= 1\
                              &arrow.double &1 &= 1
      $

      Substituindo o terno ordenado na segunda equação:
      $
        x_1 - 3x_2 + x_3 = 1 &arrow.double & 17 - 3 dot 5 + 5 & = 1\
                             &arrow.double & 7 &= 1 quad ("inválido")
      $
      Como o terno ordenado não é solução da segunda equação, também não será solução do sistema.

      Observemsos que encontramos dois ternos ordenados os quais são solução so sistema de equações. Nesse caso, podemos conluir que o sistema possui infinitas soluções. De fato, 

      #set math.mat(align: right, delim: "[")
      $
        cases(
          2x_1 &- 4x_2 &- x_3 &= 1\
          x_1 &- 3x_2 &+ x_3 &= 1\
          3x_1 &- 5x_2 &- 3x_3 &= 1
        )
        &arrow.double mat(
          2, -4, -1, 1;
          1, -3, 1, 1;
          3, -5, -3, 1
        ) 
        arrow.double
        (L_1 arrow.l.r L_2) & arrow.double &mat(
          1, -3, 1, 1;
          2, -4, -1, 1;
          3, -5, -3, 1
        )\
        &arrow.double 
        (L_2 arrow L_2 - 2L_1; L_3 arrow.l.r L_3 - 3L_1) & arrow.double &mat(
          1, -3, 1, 1;
          0, 2, -3, -1;
          0, 4, -6, -2
        )\
        &arrow.double
        (L_2 arrow.l.r L_2/2; L_3 arrow.l.r L_3/4) & arrow.double  &mat(
          1, -3, 1, 1;
          0, 1, -3/2, -1/2;
          0, 1, -3/2, -1/2
        )\
        &arrow.double 
        (L_1 arrow L_1 + 3L_2; L_3 arrow L_3 - L_2) &arrow.double &mat(
          1, 0, -7/2, -1/2;
          0, 1, -3/2, -1/2;
          0, 0, 0, 0
        )
      $
      O desenvolvimento acima mostra que o sistema de equações pode ser parametrizado em função de $x_3$:
      $
        cases(
          &x_1 - 7/2 x_3 &= -1/2\
          &x_2 - 3/2 x_3 &= -1/2
        )
        arrow.double 
        cases(
          x_1 &= -1/2 + 7/2 x_3\
          x_2 &= -1/2 + 3/2 x_3
        )
      $
      Em particular, tomando $x_3 = 1$, obtemos:
      $
        cases(
          x_1 &= -1/2 + 7/2 x_3 &= -1/2 + 7/2 &= 6/2 &= 3\
          x_2 &= -1/2 + 3/2 x_3 & = -1/2 + 3/2 &= 2/2 &= 1
        ),
      $
      que corresponde ao terno do item (a) $(3, 1,1)$. E, tomando $x_3 = 2$, obtemos:
      $
        cases(
          x_1 &= -1/2 + 7/2 x_3 &= -1/2 + 7/2 dot 2 &= -1/2 + 14/2 &= 13/2\
          x_2 &= -1/2 + 3/2 x_3 & = -1/2 + 3/2 dot 2 &= -1/2 + 6/2 &= 5/2
        ),
      $
      que corresponde ao terno do item (d) $(13/2, 5/2, 2)$.
    ])

+ Em cada parte, determine se o terno dado é uma solução do sistema linear

  $
    cases(
      &x_1 +  2&x_2 - 2&x_3 &= 3\
      3&x_1 - &x_2 + &x_3 &= 1\
      -&x_1 + 5&x_2 -5&x_3 &= 5
    )
  $

  #set enum(numbering: "(a)")
  + $(5/7, 8/7, 1)$

    #solution([
      Substituindo o terno ordenado no sistema de equações, temos:
      $
        cases(
          &x_1 +  2&x_2 - 2&x_3 &= 3\
          3&x_1 - &x_2 + &x_3 &= 1\
          -&x_1 + 5&x_2 -5&x_3 &= 5
        )
        &arrow.double 
        cases(
          &5/7 +  2 dot &8/7 - 2 dot&1 &= 3\
          3 dot&5/7 - &8/7 + &1 &= 1\
          -&5/7 + 5 dot &8/7 -5dot&1 &= 5
        )
        &arrow.double 
        cases(
         &5/7 + &16/7 - & 2 &= 3\
         &15/7 - &8/7 + &1 &= 1\
         -&5/7 +&40/7 - &5 &= 5
        )\
        &arrow.double 
        cases(
          &1 &= 3 quad crossmark\
          &2 &= 1 quad crossmark\
          &0 &= 5 quad crossmark
        )
      $
      O terno não satisfaz nenhuma das três equações, confirmando que ele não é a solução do sistema.
    ])

  + $(5/7, 8/7, 0)$

    #solution([
      Substituindo o terno no sistema, temos:
      $
        cases(
            &x_1 +  2&x_2 - 2&x_3 &= 3\
            3&x_1 - &x_2 + &x_3 &= 1\
            -&x_1 + 5&x_2 -5&x_3 &= 5
        )
        &arrow.double
        cases(
          &5/7 + 2 dot &8/7 - 2 dot &0 &= 3\
          3 dot &5/7 - &8/7 + &0 &= 1\
          -&5/7 + 5 dot &8/7 - 5 dot &0 &= 5 
        )
        arrow.double 
        cases(
          &5/7 + &16/7 &= 3\
          &15/7 - & 8/7 &= 1\
          -&5/7 + &40/7 &= 5
        )\
        &arrow.double
        cases(
          3&=3 quad checkmark\
          1&=1 quad checkmark\
          5&=6 quad checkmark
        )
      $
      Portando o terno $(5/7, 8/7, 0)$ é uma solução do sistema de equações.
    ])

  + $(5, 8, 1)$

    #solution([
      Substituindo o terno ordenado no sistema de equações, obtemos:
      $
        cases(
          &x_1 +  2&x_2 - 2&x_3 &= 3\
          3&x_1 - &x_2 + &x_3 &= 1\
          -&x_1 + 5&x_2 -5&x_3 &= 5
        )
        &arrow.double
        cases(
          &5 + 2 dot &8 - 2 dot &1 &= 3\
          3 dot &5 - & 8 + & 1 &= 1\
          -&5 + 5 dot &8 - 5 dot &1 &= 5
        )
        arrow.double 
        cases(
          19 &= 3 quad crossmark\
          8 &= 1 quad crossmark\
          30 &= 5 quad crossmark
        )
      $
      O terno não é solução do sistema de equações.
    ])

  + $(5/7, 10/7, 2/7)$

    #solution([
      Substituindo o terno no sistema, temos:
      $
        cases(
          &x_1 +  2&x_2 - 2&x_3 &= 3\
          3&x_1 - &x_2 + &x_3 &= 1\
          -&x_1 + 5&x_2 -5&x_3 &= 5
        )
        &arrow.double
        cases(
          &5/7 + 2 dot &10/7 - 2 dot &2/7 &= 3\
          3 dot &5/7 - &10/7 + &2/7 &= 1\
          -&5/7 + 5 dot &10/7 - 5 dot &2/7 &= 5
        )
        arrow.double
        cases(
          &5/7 + &20/7 - &4/7 &= 3\
          &15/7 - &10/7 + &2/7 &= 1\
          -&5/7 + &50/7 - & 10/7 &= 5
        )\
        &arrow.double 
        cases(
          21/7 &= 3\
          7/7 &= 1\
          35/7 &= 5
        )
        arrow.double
        cases(
          3 &= 3 quad checkmark\
          1 &= 1 quad checkmark\
          5 &= 5 quad checkmark
        )
      $
      Portanto, o terno $(5/7, 10/7, 2/7)$ é uma solução do sistema de equações.
    ])

  + $(5/7, 22/7, 2)$
    #solution([
      Substituindo o terno ordenado no sistema de equações, obtemos:
      $
        cases(
          &x_1 +  2&x_2 - 2&x_3 &= 3\
          3&x_1 - &x_2 + &x_3 &= 1\
          -&x_1 + 5&x_2 -5&x_3 &= 5
        )
        &arrow.double
        cases(
          &5/7 + 2 dot &22/7 - 2 dot &2 &= 3\
          3 dot &5/7 - &22/7 + &2 &= 1\
          -&5/7 + 5 dot &22/7 - 5 dot &2 &= 5
        )
        arrow.double
        cases(
          21/3 &= 3\
          7/7 &= 1\
          35/7 &= 5
        )
        arrow.double
        cases(
          3 &= 3 quad checkmark\
          1 &= 1 quad checkmark\
          5 &= 5 quad checkmark
        )
      $
      Portanto, o terno $(5/7, 22/7, 2)$ é uma solução do sistema de equações.

      Dado que encontramos mais de uma solução, o sistema deve ter infinitas soluções. De fato, 
      #set text(size: 10pt)
      #set math.mat(align: right, delim: "[")
      $
        cases(
          &x_1 +  2&x_2 - 2&x_3 &= 3\
          3&x_1 - &x_2 + &x_3 &= 1\
          -&x_1 + 5&x_2 -5&x_3 &= 5
        )
        arrow.double mat(
          1, 2, -2, 3;
          3, -1, 1, 1;
          -1, 5, -5, 5
        )
        &arrow.double (L_2 arrow 3L_1 - L_2; L_3 arrow L_1 + L_3)
        &arrow.double mat(
          1, 2, -2, 3;
          0, 7, -7, 8;
          0, 7, -7, 8
        )\
        &arrow.double (L_2 arrow L_2/5; L_3 arrow L_2 - L_3) 
        &arrow.double mat(
          1, 2, -2, 3;
          0, 1, -1, 8/7;
          0, 0, 0, 0
        )\
        &arrow.double (L_1 arrow L_1 - 2L_2) 
        &arrow.double mat(
          1, 0, 0, 5/7;
          0, 1, -1, 8/7;
          0, 0, 0, 0
        )
      $
      A partir da matriz acima, podemos escrever uma forma parametrizada para as infinitas soluções do sistema de equações. Seja $x_3 = k$. Então:
      $
        cases(
          &x_1 &= 5/7\
          x_2 - &x_3 &= 8/7
        )
        arrow.double 
        cases(
          x_1 &= 5/7\
          x_2 &= 8/7 + k\
          x_3 &= k
        )
      $

      Em particular, 
      #align(center, table(
        columns: 4,
        table.header(
          [$k$], [$x_1$], [$x_2$], [$x_3$],
        ),
        [$0$], [$5/7$], [$8/7$], [$0$],
        [$1$], [$5/7$], [$15/7$], [$1$],
        [$2$], [$5/7$], [$22/7$], [$2$],
        [$2/7$], [$5/7$], [$10/7$], [$2/7$],
      ))

    ])

+ Em cada parte, encontre o conjunto de soluções da equação linear usando um parâmetro, se necessário.

  #set enum(numbering: "(a)")
  + $7x - 5y = 3$

  + $-8x_1 + 2x_2 - 5x_3 + 6x_4 = 1$

+ Em cda parte, encontre o conjunto solução da equação linear usando um parâmetro, se necessário.

  #set enum(numbering: "(a)")
  + $3x_1 - 5x_2 + 4x_3 = 7$

  + $3v - 8w + 2x - y + 4z = 0$ 
   
