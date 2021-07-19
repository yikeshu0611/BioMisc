#' GEO data read
#' Read method
#' @return noting
#' @export
#'
#' @examples
#' geo_data_read()
geo_data_read <- function(){
    cat('\n')
    cat(crayon::green(tmcn::toUTF8("=====Affymatrics\u82AF\u7247====\n")))
    cat('oligo::read.celfiles()\n\n')
    cat(crayon::green(tmcn::toUTF8("=====Illumina\u82AF\u7247====\n")))
    message(tmcn::toUTF8("Illumina\u6570\u636E\u5F88\u591A\u90FD\u662F\u505A\u4E86\u80CC\u666F\u77EB\u6B63\u7684,\u4E0D\u9700\u8981\u518D\u6B21\u8FDB\u884C\u80CC\u666F\u77EB\u6B63"))
cat(crayon::red('1. sdf: '));cat(tmcn::toUTF8("\u6837\u672C/\u82AF\u7247\u7684\u5177\u4F53\u67B6\u6784\u3001\u5E03\u5C40\u4FE1\u606F"))
cat('\n')
cat(crayon::red('2. Metrics: '));cat(tmcn::toUTF8("\u82AF\u7247\u8D28\u91CF\u53C2\u6570\u4FE1\u606F"))
cat('\n')
cat(crayon::red('3. xml: '));cat(tmcn::toUTF8("\u4EEA\u5668\u626B\u63CF\u53C2\u6570\u548C\u5149\u5F3A\u5EA6\u6570\u503C\u7684\u63D0\u53D6\u65B9\u6CD5"))
cat('\n\n')
cat(crayon::red('4. tif: '));cat(tmcn::toUTF8("\u626B\u63CF\u540E\u7684\u56FE\u7247\u6587\u4EF6"))
cat('\n')


cat(crayon::red('5. idat: '));cat(tmcn::toUTF8("\u56FE\u7247\u7684\u4E8C\u8FDB\u5236\u6570\u636E,\u53EF\u4F9BBeadStudio/GenomeStudio\u8BFB\u53D6\u8FDB\u884C\u540E\u7EED\u5206\u6790"))
cat('\n        beadarray::readIdatFiles()')
cat('\n')
cat(crayon::red('6. locs: '));cat(tmcn::toUTF8("beads\u5750\u6807\u6570\u636E"))

cat('\n')
cat(crayon::red('7. txt: '));cat(tmcn::toUTF8("beads\u5750\u6807\u6570\u636E\u548C\u5149\u4FE1\u53F7\u5F3A\u5EA6(\u5DF2\u51CF\u53BB\u80CC\u666F\u503C)"))
cat('\n        1. beadarray::readIllumina()\n')
cat(tmcn::toUTF8("        2. \u5982\u679C\u662F6\u5217\u7684\u90A3\u79CD\u6570\u636E,\u9700\u8981\u5148\u4F7F\u7528lumiR_changeNames()\u4FEE\u6539\u539F\u6570\u636E\u6587\u4EF6\u540D,\u518D\u4F7F\u7528lumi::lumiR.batch()\u8BFB\u53D6"))
cat('\n',tmcn::toUTF8("       3. \u5982\u679C\u53EA\u67091\u4E2A\u6587\u4EF6,\u5E76\u4E14\u662F\u4EE5Sample\u548CDetection Pval\u5F00\u5934\u7684,\u90A3\u4E48\u5C31\u7528limma::read.ilmn(),\u8BBE\u7F6Eexpr=\"sample\"(\u6CE8\u610Fsample\u7684\u5927\u5C0F\u5199)\u548Cother.columns\u8FD9\u4E24\u4E2A\u53C2\u6570"))

cat('\n')
cat(crayon::red('8. IBS(Illumina Bead Summary): '));cat(tmcn::toUTF8("CSV\u683C\u5F0F,summary-level\u6570\u636E"))


cat('\n\n')
cat(crayon::red('9. bgx: '));cat(tmcn::toUTF8("\u63A2\u9488\u6CE8\u91CA\u4FE1\u606F"))

cat('\n')
}
