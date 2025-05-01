const fs = require('fs')
const env = require('dotenv').config({ path: '../../.env' })

const AWS = require('aws-sdk')
const ID = process.env.ID
const SECRET = process.env.SECRET
const BUCKET_NAME = 'kibwa--09'
const MYREGEION = 'ap-northeast-3'
const s3 = new AWS.S3({ accessKeyId : ID, secretAccessKey : SECRET, region : MYREGEION})

const downloadFile = fileName => {
    const params = {
        Bucket : BUCKET_NAME,
        Key : 'axios.png',
    }
    s3.getObject(params, function (err, data) {
        if (err) {
            throw err;
        }
        fs.writeFileSync(fileName, data.Body)
        console.log(`File downloads successfully.`)
    })
}
downloadFile('axios.png')