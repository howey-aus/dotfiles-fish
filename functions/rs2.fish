function rs2 --wraps='be rails server -p 3002' --description 'alias rs1=be rails server -p 3002'
  be rails server -p 3002 $argv
end
