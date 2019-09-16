local
_,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J={_="config",a="LuaFuncSources",b="LuaFileCache",c="LuaSession",d="FileSourcePath",e="source",f="funclist",g="linedefined",h="lastlinedefined",i="AntiLua_FunctionVerification",j="AntiLua_LuaRefresh",k="Print",l="LuaExecDetected",m="AddDetection",n="AntiLua_PUNISHMENT",o="AntiLua_BANTIME",p="funcname",q="VerifyLuaSource",r="execidentifier",s="AddSource",t="AntiLuaAddDetection",u="gAC_LuaExecStartup",v="_VMEVENTS"},CompileFile,SysTime,math.Round,jit.util.funcinfo,jit.attach,file.CreateDir,file.Exists,file.Time,file.Find,file.Read,file.Size,file.Write,hook.Add,isstring,tostring,istable,pairs,pcall,timer.Create,timer.Start,CompileString,IsValid,string.dump,string.lower,string.sub,string.Explode,string.gsub,table.remove,table.concat,util.Compress,util.Decompress,util.JSONToTable,util.TableToJSON,bit.rol,bit.bxor,debug.getregistry
m("gAC.IncludesLoaded","gAC.AntiLua",function()if!gAC[_._].AntiLua_CHECK
then
return
end
gAC[_.a]={["function: builtin#21"]={source="=[C]",short_src="[C]",what="C",lastlinedefined=-1,linedefined=-1},["function: builtin#20"]={source="=[C]",short_src="[C]",what="C",lastlinedefined=-1,linedefined=-1}}gAC[_.b]=gAC[_.b]||nil
gAC[_.c]=gAC[_.c]||{}gAC[_.d]="LUA"gAC.LuaVM=function(k)local
o=d(k)o[_.e]=A(o[_.e],"^@","")o[_.e]=gAC.dirtosvlua(o[_.e])gAC[_.b][o[_.e]]=gAC[_.b][o[_.e]]||{}local
K=gAC[_.b][o[_.e]]if
K.bytecodes
then
return
end
K[_.f]=K[_.f]||{}K[_.f][#K[_.f]+1]={linedefined=o[_.g],lastlinedefined=o[_.h],proto=ByteCode.FunctionToHash(k,o)}end
function
gAC.HashString(k)local
o=#k
for
L=1,#k
do
o=I(o,H(o,6)+k:byte(L))end
return
H(o,3)end
gAC.LuaVMID=gAC.HashString'bc'function
gAC.dirtosvlua(k)local
o=k
o=z("/",o)if
o[1]=="addons"then
B(o,1)B(o,1)B(o,1)k=C(o,"/")elseif
o[1]=="lua"then
B(o,1)k=C(o,"/")elseif
o[1]=="gamemodes"then
B(o,1)k=C(o,"/")end
return
k
end
function
gAC.VerifyLuaSource(k,o)if!gAC[_.b][k[_.e]]&&!gAC[_.c][o][k[_.e]]then
return!1
end
return!!1
end
function
gAC.AddSource(k,o,M)if
gAC[_._][_.i]then
local
N,O=u(M,o..".AddSource",!1)if!N&&O
then
return
end
local
O=w(N)local
N=ByteCode.DumpToFunctionList(O)gAC[_.c][k][o]={funclist=N}else
gAC[_.c][k][o]=!!1
end
end
function
gAC.UpdateLuaFile(k)if!gAC[_._][_.j]then
return
end
local
o=h(k,gAC[_.d])if
o~=0
then
if
o~=gAC[_.b][k].time
then
gAC[_.k]("[AntiLua] WARNING: lua refresh occured on "..k..", switching to source verification")gAC[_.b][k]={time=o}end
else
gAC[_.k]("[AntiLua] WARNING: lua refresh occured on "..k..", switching to source verification")gAC[_.b][k]=!!1
end
end
local
k={}if!gAC[_._][_.j]then
k=nil
end
function
gAC.VerifyFunction(o,P)if!gAC[_._][_.i]then
return!!1
end
local
Q=nil
if
gAC[_.b][P[_.e]]&&p(gAC[_.b][P[_.e]])&&gAC[_.b][P[_.e]][_.f]then
Q=gAC[_.b][P[_.e]][_.f]elseif
gAC[_.c][o]&&gAC[_.c][o][P[_.e]]&&p(gAC[_.c][o][P[_.e]])&&gAC[_.c][o][P[_.e]][_.f]then
Q=gAC[_.c][o][P[_.e]][_.f]end
if
Q
then
if
k&&!k[P[_.e]]then
k[P[_.e]]=!!1
gAC.UpdateLuaFile(P[_.e])return
end
for
o=1,#Q
do
local
R=Q[o]if
R[_.h]~=P[_.h]then
continue
end
if
R[_.g]~=P[_.g]then
continue
end
if
R.proto~=P.proto
then
continue
end
return!!1
end
return!1
end
return!!1
end
function
gAC.AntiLuaAddDetection(k,o,S,T)if
S~="Probable Execution"then
T[_.l]=!!1
gAC[_.m](T,o,gAC[_._][_.n],gAC[_._][_.o])else
gAC[_.m](T,o,!1,-1)end
local
U=G(k,!!1)U="WARNING: Do not reveal this to cheaters!\nClient "..T:SteamID64().."'s reply\n"..U
U=U.."\nServer's reply\n"..o.."\n"if
S=="%unknown%"then
S="Client returned a traceback with nil or unknown type (likely a client detour attempt)"elseif
S=="Invalid Source"then
S="Client returned a traceback leading to '"..k[_.e].."' which does not exist in the lua cache"elseif
S=="Invalid Bytecode"then
S="Client returned a traceback leading to '"..k[_.e].."' which exists on the lua cache\n"S=S.."however the function information returned to it is different from the lua cache"elseif
S=="Probable Execution"then
S="Client returned a traceback leading to '"..k[_.e].."' which does not exist in the lua cache\n"S=S.."however because of the given environment information, it's unable to be confirmed."end
U=U..S
l("gac-antilua/"..T:SteamID64().."-"..os.time()..".dat",U)end
gAC.Network:AddReceiver("g-AC_LuaExec",function(o,V,W)if
W[_.l]then
return
end
local
o=W:UserID()if
V=="1"then
t("gAC.AntiLua-"..o)return
end
local
X,Y=r(F,V)if!X
then
W[_.l]=!!1
gAC[_.m](W,"AntiLua network manipulation [Code 126]",gAC[_._][_.n],gAC[_._][_.o])return
end
t("gAC.AntiLua-"..o)if#Y>500
then
W[_.l]=!!1
gAC[_.m](W,"AntiLua network manipulation [Code 126]",gAC[_._][_.n],gAC[_._][_.o])end
for
V=1,#Y
do
local
X=Y[V]if
X[_.p]then
if
X[_.e]&&n(X[_.e])then
if
gAC[_.q](X,o)==!1
then
if
X.func&&gAC[_.a][X.func]then
local
V=nil
for
Z,a_
in
q(gAC[_.a][X.func])do
if
X[Z]==a_
then
V=!!1
break
end
end
if
V
then
if
X[_.p]=="RunString"||X[_.p]=="RunStringEx"||X[_.p]=="CompileString"then
if
X[_.r]then
gAC[_.s](o,X[_.r],X.code)end
end
continue
end
elseif
X[_.e]=="[C]"&&X.short_src=="[C]"&&X.what=="C"then
if
X[_.p]=="RunString"||X[_.p]=="RunStringEx"||X[_.p]=="CompileString"then
if
X[_.r]then
gAC[_.s](o,X[_.r],X.code)end
end
continue
end
gAC[_.t](X,"Unauthorized lua execution (func: "..X[_.p].." | src: "..X[_.e]..") [Code 123]","Invalid Source",W)break
elseif
X[_.p]=="RunString"||X[_.p]=="RunStringEx"||X[_.p]=="CompileString"then
if
X[_.r]then
gAC[_.s](o,X[_.r],X.code)end
end
else
gAC[_.t](X,"Unauthorized lua execution [Code 123]","%unknown%",W)break
end
else
if
X[_.e]&&n(X[_.e])then
if
gAC[_.q](X,o)==!1
then
if!W[_.u]&&X[_.e]=="Startup"then
W[_.u]=!!1
continue
else
gAC[_.t](X,"Lua environment manipulation (src: "..X[_.e]..") [Code 124]","Invalid Source",W)break
end
elseif
gAC.VerifyFunction(X,W)==!1
then
gAC[_.t](X,"Lua environment manipulation (src: "..X[_.e]..") [Code 124]","Invalid Bytecode",W)break
end
else
gAC[_.t](X,"Lua environment manipulation [Code 124]","%unknown%",W)break
end
end
end
if
k
then
k={}end
end)m("gAC.CLFilesLoaded","gAC.AntiLua",function(k)s("gAC.AntiLua-"..k:UserID(),120,1,function()if
v(k)&&!k[_.l]then
k[_.l]=!!1
gAC[_.m](k,"AntiLua information did not arrive in time [Code 125]",gAC[_._][_.n],gAC[_._][_.o])end
end)end)m("PlayerInitialSpawn","gAC.AntiLua",function(k)gAC[_.c][k:UserID()]={}end)m("PlayerDisconnected","gAC.AntiLua",function(k)gAC[_.c][k:UserID()]=nil
end)if
k
then
m("InitPostEntity","gAC.AntiLua",function(k)gAC.LuaVM=function(k)local
o=d(k)o[_.e]=A(o[_.e],"^@","")o[_.e]=gAC.dirtosvlua(o[_.e])if
p(gAC[_.b][o[_.e]])&&gAC[_.b][o[_.e]][_.f]then
gAC.UpdateLuaFile(o[_.e])end
end
local
k=J()k[_.v]=k[_.v]||{}k[_.v][gAC.LuaVMID]=gAC.LuaVM
e(function()end,"")end)end
if
gAC[_.b]==nil
then
local
function
k(o,aa,ab,ac)if!ab
then
return
end
if#o>0
then
o=o.."/"end
local
ad,ae=i(o.."*",aa)if!ad&&!ae
then
gAC[_.k]("[AntiLua] Could not add "..o.." to lua information.")return
end
for
ac,ad
in
q(ad)do
ab(o..ad,aa)end
if
ac
then
for
ad,af
in
q(ae)do
if
af~="."&&af~=".."then
k(o..af,aa,ab,ac)end
end
end
end
gAC[_.k]"[AntiLua] Initializing"if!g("gac-antilua","DATA")then
f"gac-antilua"end
gAC[_.b]={}local
o=b()gAC[_.k]"[AntiLua] Building lua file cache"if
g("gac-antilua/gac-luacache.dat","DATA")then
gAC[_.k]"[AntiLua] Detected an existing lua cache file, reading..."gAC[_.b]=F(E(j("gac-antilua/gac-luacache.dat","DATA")))gAC[_.k]"[AntiLua] Checking for modifications..."else
gAC.NoLuaCache=!!1
end
local
ag,ah,ai={},!1,gAC[_.d]local
function
aj(k)if
x(y(k,-4))~=".lua"then
return
end
if
k==""then
return
end
local
o,aj=h(k,ai),nil
if!gAC[_.b][k]then
gAC[_.k]("[AntiLua] Excluding "..k)aj=!!1
ah=!!1
elseif!p(gAC[_.b][k])||o~=gAC[_.b][k].time
then
gAC[_.k]("[AntiLua] Modifying exclusion "..k)aj=!!1
ah=!!1
end
if
aj
then
gAC[_.b][k]={time=o}local
aj=a(k)if!aj&&x(k)~=k
then
gAC[_.b][k]={time=o}aj=a(x(k))end
if!aj
then
gAC[_.k]("[AntiLua] "..k.." Compile Error")ag[#ag+1]=k.." - Compile Error (switch to source verification)"aj=nil
gAC[_.b][k]={time=o}return
end
end
end
local
ak=J()ak[_.v]=ak[_.v]||{}ak[_.v][gAC.LuaVMID]=gAC.LuaVM
e(function()end,"")k("",ai,aj,!!1)ak[_.v][gAC.LuaVMID]=nil
for
k,o
in
q(gAC[_.b])do
if
h(k,ai)==0
then
ah=!!1
gAC[_.k]("[AntiLua] Removing exclusion "..k)gAC[_.b][k]=nil
end
end
if!ah
then
gAC[_.k]"[AntiLua] Everything appears up to standards"end
gAC[_.k]("[AntiLua] Finished building lua file cache, took: "..c(b()-o,2).."s")if#ag>0
then
gAC[_.k](#ag.." lua files have issues")for
k=1,#ag
do
gAC[_.k](ag[k])end
end
if
ah
then
gAC[_.k]"[AntiLua] Saving lua cache..."if
gAC.NoLuaCache
then
gAC[_.k]"[AntiLua] Server will restart on InitPostEntity (needed to remove compiled files in lua)"m("InitPostEntity","gAC.AntiLua.Restart",function(k)gAC[_.k]"[AntiLua] Restarting..."RunConsoleCommand'_restart'end)end
o=b()l("gac-antilua/gac-luacache.dat",D(G(gAC[_.b])))gAC[_.k]("[AntiLua] Saving took: "..c(b()-o,2).."s")end
gAC[_.k]"[AntiLua] Initialization complete"end
end)