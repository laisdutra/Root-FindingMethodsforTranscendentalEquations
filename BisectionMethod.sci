function y = f(x)
    y = 1 - (1 + x).^-9 - (140 / 26.5) * x  // função para achar o 0
endfunction

a = 0.12  // começo do intervalo
b = 0.13  // fim do intervalo
x = a  // para calcular o primeiro erro relativo, também poderia ser b

while (1)
    x_anterior = x
    x = (a + b) / 2  // o ponto médio do intervalo
    erroRelativo = abs((x - x_anterior) / x)  // cálculo do erro relativo
    if (erroRelativo < 10^-3) then  // teste de saída do laço while
        break
    end
    if (f(a) * f(x) < 0) then  // método de Bolzano
        b = x  // redefine o intervalo, metade da esquerda
    else
        a = x  // redefine o intervalo, metade da direita
    end
end
