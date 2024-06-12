//카테고리 링크
function boCategory(category){
    location.href = "list.cs?category=" + category + "&cpage=1";
}

function categorySelected(boardLevel) {
    var buttons = document.querySelectorAll(".com-nav");
    buttons.forEach(function(button){
        if(button.value === boardLevel){
            button.id = "com-nav-selected";
        }
    })
}

//검색어 조건 고정
function conditionSelected(condition){
    console.log(condition)
    if(Object.keys(condition).length !== 0){
        const opt = document.querySelector("#com-condition option[value=" + condition + "]");
        opt.setAttribute("selected", true);
    }
}