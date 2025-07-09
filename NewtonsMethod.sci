function y = f(x)
    y = 1 - (1 + x).^-9 - (140 / 26.5) * x  // função cuja raiz é procurada
endfunction

function y = d(x)
    y = 9 * (1 + x).^-10 - (140 / 26.5)  // derivada da função
endfunction

x = 0.12  // valor inicial de x

while (1)
    x_anterior = x  // recebe valor de x da iteração anterior
    x = x_anterior - f(x_anterior) / d(x_anterior)  // ponto onde a reta que tangencia o x anterior toca o eixo
    erro_relativo = abs((x - x_anterior) / x)  // calcula o erro relativo
    if(erro_relativo < 10^-3) then  // condição para parar de atualizar o x
        break
    end
end
