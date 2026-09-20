# Referências de Cálculo - Produtos por Folha

## Folhas Disponíveis

### A4
- **Tamanho total:** 20cm × 28cm
- **Área útil (com margem):** 19,4cm × 27,4cm
- **Margem por imagem:** 0,3cm (todos os lados)
- **Área da margem:** 0,6cm × 0,6cm por imagem

### A3
- **Tamanho total:** 28cm × 40cm
- **Área útil (com margem):** 27,4cm × 39,4cm
- **Margem por imagem:** 0,3cm (todos os lados)
- **Área da margem:** 0,6cm × 0,6cm por imagem

## Fórmulas de Cálculo

### Imagens por folha (encaixe)
```
imagens_por_folha = (largura_folha ÷ (largura_imagem + margem)) × (altura_folha ÷ (altura_imagem + margem))
```

### Preço por imagem
```
preco_por_imagem = preco_folha ÷ imagens_por_folha
```

### Quantidade de folhas necessárias
```
folhas_necessarias = ceil(quantidade_total ÷ imagens_por_folha)
```

## Exemplo Prático
- Folha A3 (28×40cm)
- Imagem cartão de visita (9×5cm)
- Margem: 0,3cm

```
imagens_por_folha = (28 ÷ (9 + 0,6)) × (40 ÷ (5 + 0,6))
                  = (28 ÷ 9,6) × (40 ÷ 5,6)
                  = 2,92 × 7,14
                  = 20,85 → 20 imagens por folha (arredondando para baixo)
```

---

*Referência criada em: 14/09/2026*
*Autor: Paulo*
