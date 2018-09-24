#language:pt
@ecommerce
Funcionalidade: Desconto baseado no rating do cliente e no valor total do pedido

  Esquema do Cenário: aplicar o desconto
    Dado Eu como um cliente com rating "<customer_rating>"
    E Eu adicionei um produto no valor de <order_total>
    Quando Eu clico no link para fechar a compra
    Então Eu devo ter um desconto de <discount_percentage>%

  Exemplos:
    | order_total | customer_rating | discount_percentage |
    | 50.01       | Good            | 1                   |
    | 10.00       | Good            | 0                   |
    | 10.01       | Good            | 1                   |
    | 0.01        | Excellent       | 1                   |
    | 50.00       | Excellent       | 1                   |
    | 50.01       | Excellent       | 5                   |
