function y = f(x)
    y = 1 - (1+x).^-9 - (140 / 26.5) * x  // função cuja raiz é procurada
endfunction

x_anterior = 0.14  // chutes iniciais de x
x = 0.13

while (1)
    x_temporario = x_anterior  // guarda os valores da iteração anterior
    x_anterior = x
    x = x_anterior - f(x_anterior) * (x_anterior - x_temporario) / (f(x_anterior) - f(x_temporario))
     // ponto onde a reta que passa por x0 e x1 toca o eixo (reta secante à curva)
    erro_relativo = abs((x - x_anterior) / x)  // cálculo do erro
    if (erro_relativo < 10^-3) then  // condição de saída do loop
        break
    end
end
