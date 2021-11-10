
function extractRichItems(chirpText, symbol) {
    chirpText = chirpText.substring(1)
    let arry = chirpText.split(" @")
    var returnArr = []
    for(let a of arry) {
        let value = a.substring(
            a.lastIndexOf("[") + 1, 
            a.lastIndexOf("]")
        )
        let key = a.substring(
            a.lastIndexOf("(") + 1, 
            a.lastIndexOf(")")
        )
        
        if(value.charAt(0) === symbol) {
            let obj = {}
            obj[`tag`] = value
            obj[`id`] = key
    
            returnArr.push(obj)
        }
    }

    return returnArr
}

module.exports = {
    extractRichItems,
}
