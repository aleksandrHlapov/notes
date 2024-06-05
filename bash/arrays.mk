# init
## empty
arr=()
declare -a arr

## empty associative (map)
declare -A harr

## some values
arr=("v1" "v2" …)
arr=(1 2 …)
arr=(one two …)

## from command or function
arr=( $(command) )

# iterate over array
## simple
$ arr=(1 2 3); echo ${arr[*]}
1 2 3
$ arr=(1 2 3); echo ${arr[@]}
1 2 3

## loops
❯ arr=(1 2 3 4 5); for e in "${arr[*]}"; do echo "$e"; done
1 2 3 4 5
❯ arr=(1 2 3 4 5); for e in ${arr[*]}; do echo "$e"; done
1
2
3
4
5
❯ arr=(1 2 3 4 5); for e in "${arr[@]}"; do echo "$e"; done
1
2
3
4
5
❯ arr=(1 2 3 4 5); for e in ${arr[@]}; do echo "$e"; done
1
2
3
4
5

## maps
tl;dr; @kv == @vk == @zk == @kz i.e. k!v == !vk > get key, !kv == v!k > get value

❯ declare -A harr; harr[a]=123; harr[b]=456; for key val in "${(@kv)harr}"; do echo "$key $val"; done
a 123
b 456

❯ declare -A harr; harr[a]=123; harr[b]=456; for k v in "${(@vk)harr}"; do echo "$k $v"; done
a 123
b 456

❯ declare -A harr; harr[a]=123; harr[b]=456; for k in "${(@k)harr}"; do echo "$k"; done
a
b

❯ declare -A harr; harr[a]=123; harr[b]=456; for val in "${(@v)harr}"; do echo "$val"; done
123
456

❯ declare -A harr; harr[a]=123; harr[b]=456; for k v in "${(@mm)harr}"; do echo "$k $v"; done
123 456

❯ declare -A harr; harr[a]=123; harr[b]=456; for k v in "${(@mk)harr}"; do echo "$k $v"; done
a b

❯ declare -A harr; harr[a]=123; harr[b]=456; harr[c]=789; harr[d]=012; for k v in "${(@zw)harr}"; do echo "$k $v"; done
123 456
789 012

❯ declare -A harr; harr[a]=123; harr[b]=456; harr[c]=789; harr[d]=012; for k v z m in "${(@zw)harr}"; do echo "$k $v $z $m"; done
123 456 789 012

# double quotes
❯ arr=("1st item" "2nd item" "3rd item" "4th item")
❯ printf 'Word -> %s\n' ${arr[@]}
Word -> 1st item
Word -> 2nd item
Word -> 3rd item
Word -> 4th item
❯ printf 'Word -> %s\n' "${arr[@]}"
Word -> 1st item
Word -> 2nd item
Word -> 3rd item
Word -> 4th item
❯ printf 'Word -> %s\n' ${arr[*]}
Word -> 1st item
Word -> 2nd item
Word -> 3rd item
Word -> 4th item
❯ printf 'Word -> %s\n' "${arr[*]}"
Word -> 1st item 2nd item 3rd item 4th item

# add elements
❯ arr=(1 2 3); arr[5]=5; echo ${arr[*]};
1 2 3 5
❯ arr[4]=4; echo ${arr[*]};
1 2 3 4 5
❯ arr+=6; echo ${arr[*]};
1 2 3 4 5 6
❯ declare -A harr; harr[a]=1; harr[b]=2; harr+=([c]=3 [d]=4); echo ${harr[@]}
1 2 3 4
❯ declare -A harr; harr[a]=1; harr[b]=2; harr+=([c]=3 [d]=4); echo ${harr[*]}
1 2 3 4


