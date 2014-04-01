module Puppet::Parser::Functions
  newfunction(:syslogng_pdb_simple_example) do |args|
    examples = args
    examples.each do |example|
      example.each do |e|
        Puppet::Parser::Functions.function(:create_resources)
        function_create_resources(['syslogng::pdb::simple::example', { e['test_message'] => e} ])
      end
    end
  end
end

