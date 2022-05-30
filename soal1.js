const arr = ['cook', 'save', 'taste', 'aves', 'vase', 'state', 'map']
const temp = {}
const result = []
// expected result
// [
//     [ 'cook' ],
//     [ 'save', 'aves', 'vase' ],
//     [ 'taste', 'state' ],
//     [ 'map' ]
//   ]

const finalArr = []
const bubbleSort = (word) => {
    let done = false;
    word = [...word]
    let sortedWord = ''
    while (!done) {
        done = true;
        for (let i = 0; i <= word.length - 1; i++) {
            if (word[i] > word[i + 1]) {
                let temp
                done = false
                temp = word[i]
                word[i] = word[i + 1]
                word[i + 1] = temp
            }
        }
    }
    for (let i = 0; i < word.length; i++) {
        sortedWord += word[i]
    }
    return sortedWord
}

for (let i = 0; i < arr.length; i++) {
    if (temp[bubbleSort(arr[i])] && temp[bubbleSort(arr[i])].length > 0) {
        temp[bubbleSort(arr[i])].push(arr[i])
    } else {
        temp[bubbleSort(arr[i])] = [arr[i]]
    }
}

for (key in temp) {
    result.push(temp[key])
}
console.log(result);
