#!/usr/bin/env ruby

class Poco < Arch
  def initialize
    super('poco', 'poco.rb')
    @pc_incr = 1
    @vars = {
      'dst'      => {:bitnum => 3,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => 10,  :bin_radix => 10},
      'src'      => {:bitnum => 3,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => 10,  :bin_radix => 10},
      'adr'      => {:bitnum => 3,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => 10,  :bin_radix => 10},
      'imm8'     => {:bitnum => 8,  :sign => 'signed',   :label => false, :jump => nil,        :asm_radix => nil, :bin_radix => 10},
      'uimm8'    => {:bitnum => 8,  :sign => 'unsigned', :label => false, :jump => nil,        :asm_radix => nil, :bin_radix => 10},
      'lr_imm8'  => {:bitnum => 8,  :sign => 'signed',   :label => true,  :jump => 'relative', :asm_radix => nil, :bin_radix => 10},
      'lr_imm11' => {:bitnum => 11, :sign => 'signed',   :label => true,  :jump => 'relative', :asm_radix => nil, :bin_radix => 10},
      'la_imm11' => {:bitnum => 11, :sign => 'signed',   :label => true,  :jump => 'absolute', :asm_radix => nil, :bin_radix => 10}
    }
    
    @opcodes = {
      'NOP'   => {:asm => '',                     :bin => '00000_xxx_xxx_00000'      },
      'MV'    => {:asm => 'r${dst}, r${src}',     :bin => '00000_${dst}_${src}_00001'},
      'AND'   => {:asm => 'r${dst}, r${src}',     :bin => '00000_${dst}_${src}_00010'},
      'OR'    => {:asm => 'r${dst}, r${src}',     :bin => '00000_${dst}_${src}_00011'},
      'SL'    => {:asm => 'r${dst}',              :bin => '00000_${dst}_xxx_00100'   },
      'SR'    => {:asm => 'r${dst}',              :bin => '00000_${dst}_xxx_00101'   },
      'ADD'   => {:asm => 'r${dst}, r${src}',     :bin => '00000_${dst}_${src}_00110'},
      'SUB'   => {:asm => 'r${dst}, r${src}',     :bin => '00000_${dst}_${src}_00111'},
      'ST'    => {:asm => 'r${src}, \(r${adr}\)', :bin => '00000_${src}_${adr}_01000'},
      'LD'    => {:asm => 'r${dst}, \(r${adr}\)', :bin => '00000_${dst}_${adr}_01001'},
      'LB'    => {:asm => 'r${dst}, \(r${adr}\)', :bin => '00000_${dst}_${adr}_01100'},
      'LBU'   => {:asm => 'r${dst}, \(r${adr}\)', :bin => '00000_${dst}_${adr}_01101'},
      'SB'    => {:asm => 'r${src}, \(r${adr}\)', :bin => '00000_${src}_${adr}_01011'},
      'LDI'   => {:asm => 'r${dst}, #${imm8}',    :bin => '01000_${dst}_${imm8}'     },
      'LDIU'  => {:asm => 'r${dst}, #${uimm8}',   :bin => '01001_${dst}_${uimm8}'    },
      'ADDI'  => {:asm => 'r${dst}, #${imm8}',    :bin => '01100_${dst}_${imm8}'     },
      'ADDIU' => {:asm => 'r${dst}, #${uimm8}',   :bin => '01101_${dst}_${uimm8}'    },
      'LDHI'  => {:asm => 'r${dst}, #${imm8}',    :bin => '01010_${dst}_${imm8}'     },
      'BEZ'   => {:asm => 'r${dst}, ${lr_imm8}',  :bin => '10000_${dst}_${lr_imm8}'  },
      'BNZ'   => {:asm => 'r${dst}, ${lr_imm8}',  :bin => '10001_${dst}_${lr_imm8}'  },
      'BPL'   => {:asm => 'r${dst}, ${lr_imm8}',  :bin => '10010_${dst}_${lr_imm8}'  },
      'BMI'   => {:asm => 'r${dst}, ${lr_imm8}',  :bin => '10011_${dst}_${lr_imm8}'  },
      'JMP'   => {:asm => '${lr_imm11}',          :bin => '10100_${lr_imm11}'        },
      'JAL'   => {:asm => '${lr_imm11}',          :bin => '10101_${lr_imm11}'        },
      'JR'    => {:asm => 'r${dst}',              :bin => '00000_${dst}_xxx_01010'   },
      'JALR'  => {:asm => 'r${dst}',              :bin => '00000_${dst}_xxx_11000'   },
      'EINT'  => {:asm => '',                     :bin => '00000_xxx_xxx_01110'      },
      'RTI'   => {:asm => '',                     :bin => '00000_xxx_xxx_01111'      }
    }
  end
  
  def absolute_branch_address(cur_pc, dst_pc)
    return dst_pc
  end
  
  def relative_branch_address(cur_pc, dst_pc)
    return dst_pc - cur_pc - @pc_incr
  end
end


$arch = Poco.new
