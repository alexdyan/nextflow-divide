nextflow.enable.dsl=2
params.num1 = ""
params.num2 = ""
params.quotient = ""
process divide {
    container "736855904193.dkr.ecr.us-east-1.amazonaws.com/convergence-base"
    publishDir params.quotient, mode: "copy"
    input:
        val num1
        val num2
    output:
        path "quotient.txt"
    shell:
        '''
        echo "!{num1}/!{num2}" | bc > quotient.txt
        '''
}
workflow {
    divide(params.num1, params.num2)
    // println params.a.collect{"number="+it}
    // channel.fromPath(params.a).collect().view()
}