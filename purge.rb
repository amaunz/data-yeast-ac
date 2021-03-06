# gets a bunch of key values from first field of a file and prints out matching lines from a second
# used to e.g. filter out activities without structures

def GetKeys(keys);
    File.open(ARGV[1].to_s, "r") {|file|
        oldkey = ""
        file.readlines.each{|line|
            key = line.split[0]
            if (key.size && key != oldkey)
                keys << key
            end
            oldkey = key
        }
    }
    keys
end

keys = []
keys = GetKeys(keys)
File.open(ARGV[0].to_s, "r") { |file|
    lines_arr = file.readlines
    i=0
    lines_arr.each { |line|
        hay = line.split[0]
        if !keys.include?(hay) then
            puts line
        end
    }
}
