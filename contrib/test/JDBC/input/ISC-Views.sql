create table var(a char(10), b nchar(9), c nvarchar(8), d varchar(7), e text, f ntext, g varbinary(10), h binary(9), i image, j xml)
go

create table dates(a date, b time(5), c datetime, d datetime2(5), e smalldatetime, f sql_variant)
go

create table nums(a int, b smallint, c tinyint, d bigint, e bit, f float, g real, h numeric(5,3), i money, j smallmoney)
go

-- Testing bbf_original_table_name with special characters (BABEL-3398)
SET QUOTED_IDENTIFIER ON;
go
create schema [CUSTOM\schema];
go
create table [CUSTOM\schema].[CUSTOM.[CustomTable](a varchar(10));
go

Select * from information_schema.tables WHERE TABLE_NAME in ('nums', 'dates', 'var', 'CUSTOM.[CustomTable')  ORDER BY TABLE_NAME
go

drop table [CUSTOM\schema].[CUSTOM.[CustomTable];
drop schema [CUSTOM\schema];
go

-- Testing generic columns for columns schema
Select TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, COLUMN_DEFAULT, IS_NULLABLE, DATA_TYPE, DOMAIN_CATALOG, DOMAIN_SCHEMA, DOMAIN_NAME from information_schema.columns where table_name in ('nums') ORDER BY DATA_TYPE
go

-- Testing with most of the datatypes for columns schema
Select DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_NAME, collation_catalog, collation_schema, collation_name from information_schema.columns where table_name in ('var') ORDER BY DATA_TYPE
go

Select DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_NAME, collation_catalog, collation_schema, collation_name from information_schema.columns where table_name in ('dates') ORDER BY DATA_TYPE
go

Select DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_NAME, collation_catalog, collation_schema, collation_name from information_schema.columns where table_name in ('nums') ORDER BY DATA_TYPE
go

-- Testing User Defined Types
create type int_a from int
create type varchar_a from varchar(10)
go

create table isc_udt(a int_a, b varchar_a)
go

Select DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_NAME, collation_catalog, collation_schema, collation_name from information_schema.columns where table_name in ('isc_udt') ORDER BY DATA_TYPE
go

-- Testing delimited schema name
Select DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_NAME, collation_catalog, collation_schema, collation_name from [information_schema].columns where table_name in ('isc_udt') ORDER BY DATA_TYPE
Select DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_NAME, collation_catalog, collation_schema, collation_name from "information_schema".columns where table_name in ('isc_udt') ORDER BY DATA_TYPE
go

-- Testing Cross Database refences
Create database isc_db
go

Use isc_db
go

Select * from information_schema.tables
go

-- Will only include sysdatabases view
select count(*) from information_schema.tables WHERE TABLE_NAME != 'sysdatabases'
select count(*) from information_schema.columns WHERE TABLE_NAME != 'sysdatabases'
go

Use master
go

-- Testing information_schema.views
create view vnums as select * from nums;
go

create view vcnums as select * from nums with check option;
go

-- create view with definition length more than 4000 char
create view lview as select 'provvwstdjtlyzygsxcnqlkyukpjlseachjalbtttvujvdnhooy
ursfkalzuixjyhogeijfpyidmrjciefitzurwxrazaqbmpljryfhmraftlwmktxqzsrhnbfgftqdxpxs
acoeyzmmrfptpuorfbsyaiumgwumeejdpgfkhekumxqqzplnpojlzwpeoznospniqdyfmgyifgrqjpia
pjszcykssdgfnzjsgsbzjfcebtlxytwtczrufccrpcufzitbvpgdhyishwlkatimhxkzvsgqxdrqdiie
glnizryhllxlqhfnxeyjofmopglwczssmrocmkqdstpmldifjwvdzwebyruaxlcaxqyiljfmmmohealr
zerdjymvoetanchzpfpfxtnkenlsxolaoibfdqkhvwpvcvnovvzmgmjbxowimunqmqqlrvvdhlvdvoku
vwbdurvxzonhmdnqxejtwraxtkmtzsvgawpsvtscmcnevslmantvrvbcaeotvhqbfukdadxxiwvumrya
asyerhdnexyztbjdlpourvdnfmkxysjysksivurxowjjsizcxyhrkciwhutpnxxqknjgkuvbmxywpbdl
eydsfyahzhhjzmadkjizjvnqweqdztdepjnaowwhqdixrwhkqnhpeyujpbczsimjfxtdfmtlqvlkxpmh
gcpgnvqiwgxigliotyfyfdumuxrrxpyaepflxwvnxrneyladslmmkrvapylaezrczkykiwtgiuxjgbkg
pshlptwxzmefdjqpbjaxszrqkcujxhkdksbbskiuazijfoivmskwqtbnglqedoknyofvvjiyowjsunsw
yukjypmejicaivpxslbrfsmbostwmdoypilvjsqucymywzqbzyicyyjsqslnqfbqegoejxivmrffvpum
hjouhgvzfgyajrhjilxcckznwbmpehsmztlwuvthgqtghlghdydgoxxatxmtwrwnelmpolxytoibraal
dzbdndccayqsqwqumcifenspaxztpqaxdcotbgsrnlriwkkvzgdextdivauvzpipgaodgsoqnutzklki
ebpbmygeguartyqxascsaepwwdrdxdxbfgzjypmwisibntyckagqpseqoqbrzgxtpxbtwsxogyvszsoc
vurmfyhyvrzwwsoiglyoyuwbimbdfuuxjkhubgvrfodfbmsafvuzbhqavujwifvlpswykpgcjvywpvuw
qcqmqtjwsezttpjqcbghrhprxmplsqafbomdipbyhdsendkokartnklgggprtjdoegrjrmvaudgahzfm
eljseivxkflgkfatfgogmcnbgsnyhvzstelyxfzcufotrjjodijlkdusbrcnkubbfgjtgbzymwgwbfpa
xdhrchgnipfomyyiikhbconzphustwlpbkgvcpctczctgmzohcjfcccbjycehksregjffvfoymcbrsxg
jqfjnfjfhvskohydaoxjpiunoflvwwgtjdilntlxruztsfizglsxzihqtvznczxvpbygqpaxxoienkgy
dytnfzmtzdhtakoikhneaapanhbcshvdxganertfbjtmbaioxiacmfguopzdaswgvzvzwyimbvkjivhd
deyaijgjcezpyprnuhzrrefrnxsbcsodhpawjepsngcbyftltqvmdlmoifeffzarkkabglekkxnanpue
ylybjllbkjwpplxqyympjnsyitqpubftpeiacohxrogjkdcpqepcwebvsqsuenkprjrkvakazbneqwfr
khaiuuekrhdvdmdeftofrnihzrsnbalqjlzzxuhcmluhbqhsnnnrwywyzhyrimnojsynssscxdmmpyqo
yqqerfvjwbpzcrvjqksampppyffoktbvnlejekvhivdgrbhnfbxekanpylutuwvvayysnrqajxvcsjaq
wgzbnsljgzhapkkorsfwyiftfrhllcjwkzpbphiliiwnpsfiofiwioniousqmyfabldkogeahufsorgc
daulusynkcowzkgzwnclzycxmtxtiqmkxebrwpiwnvvxxmitrclpmfsslwboswpnyjncpyfllllhbzau
hrztubiriulxedzqduzvygomolxssbbvyrevgiirzkjchteyimchgqfzdzwbubdcptwamyegsncyhxng
qyhlnninraksjbfwthlgsehhukjqfspnttatpqnwryohzhfldfhfxmvgnxbzerwnmmceaokxgongbxlg
twwwlyuwejrhvbnnsqalbsnzmaorwrdrfyjklkcyxxzatfzajwkoryfalpirewqmwvtxttuvsyftuvil
nnmjagxhajnspfiywchskgvairrexlrayyrkbwsgxxaoxcjuslgnwrotofwvyqbdrvfgdsjuslsfwrvg
soghflwjyivumqiauuqktdsgeecqktsfqcgpnpqypoevoeuxtliqcvrioednzxsygdklfufcdqkkfiys
biqdbrlsgiznbxdpjbkeqhawyuzwkfxgmykmqrqyuwnzcbmpthnuknmkgrnlzcfutcnvthoejiiinmug
idsyogvcsiwfwvdzauwenxonrdudwfsmocsfhqdanzrdyiafnztshpwaivbxnihtaornxujdjgdrirfo
ghvaniejkboptmxjzsmmbmxzirnsvejpdmjrgknbqhovuioofmyyaylrscvhyilbihpcimebumipsefb
cpkbboajblaemlgbdhziuoewdahiyomgdvyijtdqwvgrpmrntyfdsrlyvqxrqlrepyjnswysanekarpz
koeonordbcueojxcsdawbwbpyxhnikfgodsgqnawwbjfynaorgkaltsiciptjeadqijiawcvvcdjxwfm
ftgsqthdjkwletsknosrflsexbumdhrptkzkckfvlxaooansrylwdgazzoofvwaoifwogthkrthrywfd
azakaeqemgtepmpjpimcqrcqwqozgmymbavbziztmdeothaxljdvvjxldjczjwtouedwzewwwnbugjou
htytwbjosbvbhwhgjzmvunvhuftajlzxtedauvudznbdznfdsegoiwaewshchsuprvbgcyxuvvphmync
fucszaioeqbtrdhpatnwinbenkxsfchuagcqpkepkktcujnazepbcujcjoopsyidlggxhyerkgqhxozu
xlexrjexjkeocvhbsgefwrxtcvrunsdsqkivgfbveuwbkdpuqykckjjzkyiurviccyhkigqgwauqfudx
hfqehcsidgrdeqveqicqnlubecuhihchrgscrmtvromvklfmcgckvdlljqybumgzqdtirizlithvtjgh
xsvdpwhqhmlntqpugtslhtebznfkbvuihtrgwymxbfamykqqjnaosueenotsnmvwpwzbzjkdspesibon
iokannleitpjuvqxteiioozzymvmnohcksmqtigmeamguheqbiesnxuwhfrobdveiwqykxcfxfgiojmd
hdoyhwwcdietkrtwclibdwftbafyioskcmzdozabrvzofsoanzpmolpyhsnyquihpzdquksylxbpbyog
zdlrfazfvefoyavralxogzicjoxgmsjqcznyiuwaizwpwfxdtlhxiyadgurhwmnjdliymurukkxugdtp
zsyqtrxrcmxihounkkrqpnirputcjynozfopvrjymupchfjcbgebiwhbejmsrhlonbjxadmxekwwmbsf
cgikmgfvzwyrbunlxcwmihykwywozqdyfdvjjpiammriimvcxemadanokpgmcspgohxonrdaylklymiu
gkqfabhrgyfcjaylrehyzwwddvhmcfhikodhoifqfffvuaoqfwvrjmdcmxrifwgvuwzyipiraayhxdfb
zyefbktrlulbapwfjbhypdvumdpxv';
go

-- create view with definition length equal to 4000 char
create view nlview as select 'prtdjtlyzygsxcnqlkyukpjlseachjalbtttvujvdnhooy
ursfkalzuixjyhogeijfpyidmrjciefizurwxrazaqbmpljryfhmraftlwmktxqzsrhnbfgftqdxpxs
acoeyzmmrfptpuorfbsyaiumgwumeejdgfkhekumxqqzplnpojlzwpeoznospniqdyfmgyifgrqjpia
pjszcykssdgfnzjsgsbzjfcebtlxytwtzrufccrpcufzitbvpgdhyishwlkatimhxkzvsgqxdrqdiie
glnizryhllxlqhfnxeyjofmopglwczssrocmkqdstpmldifjwvdzwebyruaxlcaxqyiljfmmmohealr
zerdjymvoetanchzpfpfxtnkenlsxolaibfdqkhvwpvcvnovvzmgmjbxowimunqmqqlrvvdhlvdvoku
vwbdurvxzonhmdnqxejtwraxtkmtzsvgawpsvtscmcnevslmantvrvbcaeotvhqbfukdadxxiwvumrya
asyerhdnexyztbjdlpourvdnfmkxysjysksivurxowjjsizcxyhrkciwhutpnxxqknjgkuvbmxywpbdl
eydsfyahzhhjzmadkjizjvnqweqdztdepjnaowwhqdixrwhkqnhpeyujpbczsimjfxtdfmtlqvlkxpmh
gcpgnvqiwgxigliotyfyfdumuxrrxpyaepflxwvnxrneyladslmmkrvapylaezrczkykiwtgiuxjgbkg
pshlptwxzmefdjqpbjaxszrqkcujxhkdksbbskiuazijfoivmskwqtbnglqedoknyofvvjiyowjsunsw
yukjypmejicaivpxslbrfsmbostwmdoypilvjsqucymywzqbzyicyyjsqslnqfbqegoejxivmrffvpum
hjouhgvzfgyajrhjilxcckznwbmpehsmztlwuvthgqtghlghdydgoxxatxmtwrwnelmpolxytoibraal
dzbdndccayqsqwqumcifenspaxztpqaxdcotbgsrnlriwkkvzgdextdivauvzpipgaodgsoqnutzklki
ebpbmygeguartyqxascsaepwwdrdxdxbfgzjypmwisibntyckagqpseqoqbrzgxtpxbtwsxogyvszsoc
vurmfyhyvrzwwsoiglyoyuwbimbdfuuxjkhubgvrfodfbmsafvuzbhqavujwifvlpswykpgcjvywpvuw
qcqmqtjwsezttpjqcbghrhprxmplsqafbomdipbyhdsendkokartnklgggprtjdoegrjrmvaudgahzfm
eljseivxkflgkfatfgogmcnbgsnyhvzstelyxfzcufotrjjodijlkdusbrcnkubbfgjtgbzymwgwbfpa
xdhrchgnipfomyyiikhbconzphustwlpbkgvcpctczctgmzohcjfcccbjycehksregjffvfoymcbrsxg
jqfjnfjfhvskohydaoxjpiunoflvwwgtjdilntlxruztsfizglsxzihqtvznczxvpbygqpaxxoienkgy
dytnfzmtzdhtakoikhneaapanhbcshvdxganertfbjtmbaioxiacmfguopzdaswgvzvzwyimbvkjivhd
deyaijgjcezpyprnuhzrrefrnxsbcsodhpawjepsngcbyftltqvmdlmoifeffzarkkabglekkxnanpue
ylybjllbkjwpplxqyympjnsyitqpubftpeiacohxrogjkdcpqepcwebvsqsuenkprjrkvakazbneqwfr
khaiuuekrhdvdmdeftofrnihzrsnbalqjlzzxuhcmluhbqhsnnnrwywyzhyrimnojsynssscxdmmpyqo
yqqerfvjwbpzcrvjqksampppyffoktbvnlejekvhivdgrbhnfbxekanpylutuwvvayysnrqajxvcsjaq
wgzbnsljgzhapkkorsfwyiftfrhllcjwkzpbphiliiwnpsfiofiwioniousqmyfabldkogeahufsorgc
daulusynkcowzkgzwnclzycxmtxtiqmkxebrwpiwnvvxxmitrclpmfsslwboswpnyjncpyfllllhbzau
hrztubiriulxedzqduzvygomolxssbbvyrevgiirzkjchteyimchgqfzdzwbubdcptwamyegsncyhxng
qyhlnninraksjbfwthlgsehhukjqfspnttatpqnwryohzhfldfhfxmvgnxbzerwnmmceaokxgongbxlg
twwwlyuwejrhvbnnsqalbsnzmaorwrdrfyjklkcyxxzatfzajwkoryfalpirewqmwvtxttuvsyftuvil
nnmjagxhajnspfiywchskgvairrexlrayyrkbwsgxxaoxcjuslgnwrotofwvyqbdrvfgdsjuslsfwrvg
soghflwjyivumqiauuqktdsgeecqktsfqcgpnpqypoevoeuxtliqcvrioednzxsygdklfufcdqkkfiys
biqdbrlsgiznbxdpjbkeqhawyuzwkfxgmykmqrqyuwnzcbmpthnuknmkgrnlzcfutcnvthoejiiinmug
idsyogvcsiwfwvdzauwenxonrdudwfsmocsfhqdanzrdyiafnztshpwaivbxnihtaornxujdjgdrirfo
ghvaniejkboptmxjzsmmbmxzirnsvejpdmjrgknbqhovuioofmyyaylrscvhyilbihpcimebumipsefb
cpkbboajblaemlgbdhziuoewdahiyomgdvyijtdqwvgrpmrntyfdsrlyvqxrqlrepyjnswysanekarpz
koeonordbcueojxcsdawbwbpyxhnikfgodsgqnawwbjfynaorgkaltsiciptjeadqijiawcvvcdjxwfm
ftgsqthdjkwletsknosrflsexbumdhrptkzkckfvlxaooansrylwdgazzoofvwaoifwogthkrthrywfd
azakaeqemgtepmpjpimcqrcqwqozgmymbavbziztmdeothaxljdvvjxldjczjwtouedwzewwwnbugjou
htytwbjosbvbhwhgjzmvunvhuftajlzxtedauvudznbdznfdsegoiwaewshchsuprvbgcyxuvvphmync
fucszaioeqbtrdhpatnwinbenkxsfchuagcqpkepkktcujnazepbcujcjoopsyidlggxhyerkgqhxozu
xlexrjexjkeocvhbsgefwrxtcvrunsdsqkivgfbveuwbkdpuqykckjjzkyiurviccyhkigqgwauqfudx
hfqehcsidgrdeqveqicqnlubecuhihchrgscrmtvromvklfmcgckvdlljqybumgzqdtirizlithvtjgh
xsvdpwhqhmlntqpugtslhtebznfkbvuihtrgwymxbfamykqqjnaosueenotsnmvwpwzbzjkdspesibon
iokannleitpjuvqxteiioozzymvmnohcksmqtigmeamguheqbiesnxuwhfrobdveiwqykxcfxfgiojmd
hdoyhwwcdietkrtwclibdwftbafyioskcmzdozabrvzofsoanzpmolpyhsnyquihpzdquksylxbpbyog
zdlrfazfvefoyavralxogzicjoxgmsjqcznyiuwaizwpwfxdtlhxiyadgurhwmnjdliymurukkxugdtp
zsyqtrxrcmxihounkkrqpnirputcjynozfopvrjymupchfjcbgebiwhbejmsrhlonbjxadmxekwwmbsf
cgikmgfvzwyrbunlxcwmihykwywozqdyfdvjjpiammriimvcxemadanokpgmcspgohxonrdaylklymiu
asdfghjklqwertyuiopasdfghjklasdfghjklz';
go

select * from information_schema.views where TABLE_NAME in ('vnums', 'vcnums')  ORDER BY TABLE_NAME
go

-- Get the length of view def
select object_name,length(definition) from sys.babelfish_view_def where object_name in ('lview','nlview') order by object_name;
go

-- This should be truncated
select length(view_definition) from information_schema.views where TABLE_NAME = 'lview';
go

-- This shouldn't be truncated
select length(view_definition) from information_schema.views where TABLE_NAME = 'nlview';
go

-- Cross db ref testing for ISC.Views view
Use isc_db
go

Select table_catalog, table_schema, table_name from information_schema.views
go

-- Will only include sysdatabases view
select count(*) from information_schema.views WHERE TABLE_NAME != 'sysdatabases'
go

Use master
go

create schema sch1;
go

create view sch1.v1 as select 1;
go

select * from information_schema.views where TABLE_NAME = 'v1'  ORDER BY TABLE_NAME
go

-- clean-up
DROP VIEW vnums
DROP VIEW vcnums
DROP VIEW lview
DROP VIEW nlview
DROP TABLE nums
DROP TABLE dates
DROP TABLE var
DROP TABLE isc_udt
DROP TYPE int_a
DROP TYPE varchar_a
DROP DATABASE isc_db
DROP VIEW sch1.v1
go
DROP SCHEMA sch1
go

-- Tests for numeric scale and precision
create type numeric_test from numeric(15,6)
GO

create type decimal_test from decimal(15,6)
GO

create table babel_2863(_numcol_bbf_13d0 decimal(13), _numcol_bbf_13n0 numeric(13), _numcol_bbf_15d6 decimal(15,6), _numcol_bbf_15n6 numeric(15,6), _numcol_numeric_test numeric_test, _numcol_decimal_test decimal_test)
GO

select column_name,numeric_precision, numeric_scale from information_schema.columns where column_name like '_numcol_%' order by column_name;
GO

drop table babel_2863;
GO

drop type numeric_test;
GO

drop type decimal_test;
GO