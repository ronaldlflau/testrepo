package main

import (
"fmt"
"github.com/aws/aws-sdk-go/aws"
"github.com/aws/aws-sdk-go/ec2"
)

func main() {

svc := ec2.New(session.New())
input := &ec2.DescribeRegionsInput{}

result, err := svc.DescribeRegions(input)
if err != nil {
    if aerr, ok := err.(awserr.Error); ok {
        switch aerr.Code() {
        default:
            fmt.Println(aerr.Error())
        }
    } else {
        // Print the error, cast err to awserr.Error to get the Code and
        // Message from an error.
        fmt.Println(err.Error())
    }
    return
}

fmt.Println(result)
}
