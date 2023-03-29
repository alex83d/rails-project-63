### Hexlet tests and linter status:
[![Actions Status](https://github.com/alex83d/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/alex83d/rails-project-63/actions)
[![Ruby form](https://github.com/alex83d/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/alex83d/rails-project-63/actions/workflows/main.yml)
# HexletCode


## Attention! This is a learning project

### HexletCode
HexletCode - это генератор форм для шаблонов сайтов. С его помощью можно удобно и быстро создавать различные формы, например, формы регистрации или формы обратной связи.

### Установка
Установка производится с помощью команды gem install hexlet_code.

### Пример использования:

 `require 'hexlet_code`

### Определяем структуру, которая будет использоваться для формы

 `User = Struct.new(:id, :name, :job)`

### Создаем экземпляр структуры

 `user = User.new`

### Генерируем HTML-код для формы

```ruby
res = HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end
puts res
```

### Будет выведено:

```html
<form action="/users" method="post">
    <label for="name">Name</label>
    <input name="name" value="" type="text">
    <label for="job">Job</label>
    <textarea cols="20" rows="40" name="job"></textarea>
    <input type="submit" value="Create">
</form>
```

## API

### `form_for(entity, url:, **attributes)`

Метод, который генерирует HTML-код формы.

#### Аргументы:
`entity` - объект, для которого генерируется форма
`url` - адрес, на который будет отправлен запрос при отправке формы
`attributes` - дополнительные параметры для формы
#### Блок:
В блок передается объект, представляющий форму. Внутри блока можно вызывать методы объекта, чтобы добавлять элементы в форму. В конце блока нужно вызвать метод submit, чтобы добавить кнопку отправки формы.

### `input(name, **options)`

Метод, который генерирует HTML-код для элемента формы.

#### Аргументы:
`name` - имя элемента формы
`options` - дополнительные параметры для элемента формы
#### Опции:
`label` - текст метки элемента (по умолчанию используется заглавное имя поля)
`as` - тип элемента (одно из: :string, :password, :text)

### `submit(name = 'Save')`

Метод, который генерирует HTML-код для кнопки отправки формы.
### Аргументы:
`name` - текст на кнопке (по умолчанию используется 'Save')
но можно переопределить:
 `f.submit 'Wow'`

### Совместимость
HexletCode написан на языке Ruby.
