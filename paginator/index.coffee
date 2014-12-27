Paginator = ->

module.exports = Paginator

Paginator::view = __dirname

paginationArr = (currentPage, totalPages, totalBtns = 10, separator = '...')->
  pageArr = []

  biggerPart = totalBtns - Math.floor totalBtns / 3
  smallPart  = totalBtns - biggerPart

  if totalPages <= totalBtns # tem botoes sufientes para o numero de paginas
    x = 1
    while x <= totalPages
      pageArr.push p : x, name : x, selected : currentPage == x
      x++
    return pageArr

  # Calha na parte do meio da lista de botoes
  if currentPage > smallPart and currentPage < totalPages - smallPart
    x = 1
    while x < smallPart
      pageArr.push p : x, name : x, selected : currentPage == x
      x++
    pageArr.push name : separator, disabled : true
    delta = currentPage - Math.ceil smallPart  / 2
    x = 1
    while x <= smallPart
      n = x + delta
      pageArr.push p : n, name : n, selected : currentPage == n
      x++
    pageArr.push name : separator, disabled : true
    delta = currentPage - Math.floor smallPart  / 2
    x = totalPages - smallPart + 2
    while x <= totalPages
      pageArr.push p : x, name : x, selected : currentPage == x
      x++
    return pageArr

  if currentPage <= biggerPart # calhou na parte inicio
    x = 1
    while x < biggerPart
      pageArr.push p : x, name : x, selected : currentPage == x
      x++
    pageArr.push name : separator, disabled : true
    x = totalPages - smallPart + 1
    while x <= totalPages
      pageArr.push p : x, name : x, selected : currentPage == x
      x++
    return pageArr

  if currentPage >= totalBtns - biggerPart # calhou na parte maior no fim
    x = 1
    while x <= smallPart
      pageArr.push p : x, name : x, selected : currentPage == x
      x++
    pageArr.push name : separator, disabled : true
    x = totalPages - (biggerPart - 2)
    while x <= totalPages
      pageArr.push p : x, name : x, selected : currentPage == x
      x++
    return pageArr

### debug
app.test2 = paginationArr
app.test = (c, t)->
  return paginationArr(c, t).map (p)->
    if p.selected then "["+p.name+"]" else p.name
###

# 'count' and 'items' are component's private paths
Paginator::init = ->

  # output componet path
  # input paths..., function with params
  # reactive funcion to run
  @model.start "pagesData", "page", "total", "perPage",
    (page, total, perPage) ->
      totalPages = Math.ceil total / (perPage ? 1)
      return paginationArr page, totalPages

  return

Paginator::create = (model, dom) ->
  paginator = this
  model.setNull "selected", 1
  return

Paginator::select = (pageNr) ->
  @model.set "page", pageNr
  return