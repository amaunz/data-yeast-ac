#/usr/bin/env ruby

require 'rubygems'
gem 'chemruby'
require 'chem'
require 'openbabel'
require '/usr/local/lib/ruby/site_ruby/1.8/chem/db/sdf.rb'

def smi2sdf(smi)
    c=OpenBabel::OBConversion.new
    c.set_in_format 'smi'
    cp = OpenBabel::OBMol.new 
    c.read_string cp, smi.to_s
    c.set_out_format 'sdf'
    sdf = c.write_string cp 
end

def sdf2gspan(file_in, file_out)
    mdl = Chem::MDL::SdfParser.new(file_in)
    mdl.each { |mol|
        Chem::GSpan.save([mol], file_out)
    }
end

sdf2gspan(ARGV[0].to_s, ARGV[1].to_s)
