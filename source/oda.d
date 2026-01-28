import std.stdio;
import std.file;
import core.stdc.stdlib;
import std.regex;
import std.string;

void main(string[] args){
    string oda_ver = "v1.0.0";
    if (args.length < 2){
        writeln("\033[1m\033[31mOdav1: \033[0mCannot found this '.oda' source package.");
    } else {
        writeln("\033[1mOda " ~ oda_ver ~ "\033[0m");
        writeln("\033[1mGrab " ~ args[1] ~ " from mirror hosting by 'device'...");
        //string __odacmd1__ = "curl -s -L \"https://raw.githubusercontent.com/Pouyamohamadi-cpu/oda-mirror/main/" ~ args[1] ~ "\"";
        //system(toStringz(__odacmd1__));
        if (exists(args[1])){
            auto fhh = args[1];
            fhh = fhh.replace(".oda", "");
            writeln("\033[1m" ~ fhh ~ " \033[0mGetted.");
            writeln("\033[1mStart progress...\033[0m");
            string __odacmd2__ = "unrar x -y " ~ args[1];
            system(toStringz(__odacmd2__));
            auto file_c = readText("config.odac");
            auto djd = regex(`compiler (\S+)`);
            auto hffh = match(file_c, djd);
            if (!hffh.empty){
                if (hffh.captures[1] == "dmd"){
                    writeln("\033[0mUse \033[1mdmd\033[0m as compiler target.");
                    system(toStringz("dmd " ~ "code/" ~ fhh ~ ".d"));
                    if (exists(fhh)){
                        writeln("\033[1m\033[32mCompile progress complate without any error.\033[0m");

                        system(toStringz("sudo cp " ~ fhh ~ " /usr/bin"));
                        system(toStringz("rm " ~ fhh));
                        auto fdg = regex(`test "(.*?)"`);
                        auto hfhf = match(file_c, fdg);
                        if (!fdg.empty){
                            system(toStringz(hfhf.captures[1]));
                            
                        } else {
                            writeln("\033[1m" ~ fhh ~ "install and build withoust any error.\033[0m");
                            auto shh = regex(`note "(.*?)"`);
                            auto ssh2 = match(file_c, shh);
                            if (!ssh2.empty){
                                writeln(ssh2.captures[1]);
                            }
                        }
                    }
                }
            }
        } else {
            writeln("\033[31m\033[1mOdav1: \033[0mCannot found " ~ args[1] ~ " or it not exists.");
        }
    }
}