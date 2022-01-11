## Entrando no psql com o usuário postgres
`psql`

## Listando os usuários existentes
`\du`

##  Criando o usuário que será destinado a leitura/select
```sql
CREATE USER usr_lgpd WITH ENCRYPTED PASSWORD '#YourStrong!Passw0rd#';
```

## Conectando na database no qual desejamos permitir leitura/select
`\c dw`

## Listamos todos os Schemas da database que estamos conectado
`\dn`

## Aplicando permissão/Grant de select e de uso para cada schema do banco em que desejamos permitir a leitura/select
```sql
GRANT USAGE ON SCHEMA public TO usr_lgpd;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usr_lgpd;

GRANT USAGE ON SCHEMA dm_onihosp TO usr_lgpd;
GRANT SELECT ON ALL TABLES IN SCHEMA dm_onihosp TO usr_lgpd;

GRANT USAGE ON SCHEMA dm_agenda_onigestor TO usr_lgpd;
GRANT SELECT ON ALL TABLES IN SCHEMA dm_agenda_onigestor TO usr_lgpd;
```






# Abaixo comandos para eliminar o usuário

## Dropando o usuário
```sql
REVOKE USAGE ON SCHEMA public FROM usr_lgpd;
REVOKE USAGE ON SCHEMA dm_onihosp FROM usr_lgpd;
REVOKE USAGE ON SCHEMA dm_agenda_onigestor FROM usr_lgpd;
REVOKE SELECT ON ALL TABLES IN SCHEMA public FROM usr_lgpd;
REVOKE SELECT ON ALL TABLES IN SCHEMA dm_onihosp FROM usr_lgpd;
REVOKE SELECT ON ALL TABLES IN SCHEMA dm_agenda_onigestor FROM usr_lgpd;
DROP USER usr_lgpd;
```







# PROJETO FRONT-END DO ONI SAÚDE

## INSTALAÇÃO

Antes de executar o servidor fazer a instalação dos pacotes utilizando o comando:
`npm install`

Após terminar a instalação de todos os pacotes, para executar o servidor utilizar o comando:
`npm run dev`

## DOCUMENTAÇÃO

### FRAMEWORKS & APIs

Foram escolhidos para esse projeto a utilização das bibliotecas e frameworks abaixo:

- [Vue.js](https://vuejs.org/v2/guide/)
- [Vuex](https://vuex.vuejs.org/#what-is-a-state-management-pattern)
- [Nuxt.js](https://nuxtjs.org/docs/2.x/get-started/installation)
- [Element UI](https://element.eleme.io/#/en-US/component/installation)
- [Axios](https://www.npmjs.com/package/axios)
- [Fontawesome](https://www.npmjs.com/package/@fortawesome/vue-fontawesome)

### PADRÕES DE DESENVOLVIMENTO

Visando facilitar o entendimento das regras de negócios e das funcionalidades do sistema é preciso manter uma boa qualidade de código e produto, adotando um padrão de desenvolvimento. Portanto, deve-se seguir as seguintes regras:

- Não colocar ; ao final de cada expressão.

- Usar sempre aspas simples para inserir strings.

```javascript
let string = 'Hello World'
```

- Usar sempre as declarações de variável com `const` e `let`. NÃO USAR declarações com `var`.

```javascript
const texto = 'Hello World'
let numero = 1234
```

- Usar nomes explicativos para variáveis e funções. Evitar usar nomes como `variavel1`, `numero`, `abcid`.

```javascript
const primeiroNome = 'Fulano'
const ultimoNome = 'Silva'

function mostrarNomeCompleto(primeiroNome, ultimoNome) {
  return primeiroNome + ' ' + ultimoNome
}
```

- Utilizar os nomes em português e no estilo camelCase.

```javascript
let helloWorld = 'Hello World'
```

- Nomes das tags dos componentes na área do template, utilizar o estilo kebab-case. Usar o estilo camelCase somente para códigos em javascript.

```html
<template>
  <form-input></form-input>
</template>
```

- Estilos dos componentes devem ficar dentro do arquivo do componente na área `style` sempre com a tag `scoped`. Quando o estilo for usado em mais de um componente pode-se considerar criar uma classe nos arquivos globais como `main.css` e `button.css`.

```html
<style scoped>
  .btn-primary {
    background-color: green;
  }
</style>
```

- Quando for preciso utlizar um componente do framework Element UI, em vez de inserir diretamente no código, criar um componente que implemente o que for ser usado para abstrair sua ideia e evitar problemas de manutenção.

```html
<template>
  <el-input v-bind="$attrs"></el-input>
</template>
```

- Sempre que for usar ícones, usar a bilbioteca FontAwesome. Não usar svgs direto no template.

```html
<template>
  <font-awesome-icon :icon="myIcon"></font-awesome-icon>
</template>
```

```javascript
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faSpinner } from '@fortawesome/free-solid-svg-icons'

export default {
  components: {
    FontAwesomeIcon,
  },
  data() {
    return {
      myIcon: faSpinner,
    }
  },
}
```

- Sempre que for usar cores em quaisquer componentes, verificar a tabela de cores dentro do arquivo `main.css` no selector `:root`. Caso a cor que precisar não estiver lá, adicionar uma variável seguindo os exemplos e usá-la com o comando `var(--nome-da-cor)`.

```css
/* assets/css/main.css */
:root {
  --primary: #67c23a;
  --secondary: #909399;
  --info: #409eff;
  --warning: #e6a23c;
  --danger: #f56c6c;
  --dark: #303133;
}
```
