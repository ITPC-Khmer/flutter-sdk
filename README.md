# cloudnet

A new Flutter project.

## Getting Started

gInputSelect(
context: context,
controller: controller,
isRequire: true,
placeholder: "With Suffic Icon",
gList: List.generate(5, (ix) =>  ListModel(key: "$ix", title: "title $ix",data: ix)
),
onClear: (){
 //dosomething
},
onSelect: (i,v){
    print("I : $i , v: $v");
}

);
