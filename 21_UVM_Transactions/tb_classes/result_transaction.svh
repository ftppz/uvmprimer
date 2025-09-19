/*
   Copyright 2013 Ray Salemi

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
class result_transaction extends uvm_transaction;

	shortint result;
	
	function bit do_compare(uvm_object rhs, uvm_comparer comparer);
		result_transaction RHS;
		bit same;
		
		if (rhs == null) begin
			`uvm_error("COMPARE", "Attempted to compare with null transaction")
			return 0;
		end

		if (!$cast(RHS, rhs)) begin
			return 0;
		end else begin
			same = super.do_compare(rhs, comparer);
			same = (result == RHS.result) && same;
		end

		return same;
	endfunction : do_compare

	function void do_copy(uvm_object rhs);
		result_transaction copied_transaction_h;
		assert(rhs != null) else
			$fatal(1,"Tried to copy null transaction");
		super.do_copy(rhs);
		assert($cast(copied_transaction_h,rhs)) else
			$fatal(1,"Faied cast in do_copy");
		result = copied_transaction_h.result;
	endfunction : do_copy

	function string convert2string();
		string s;
		s = $sformatf("result: %4h",result);
		return s;
	endfunction : convert2string
	
	function new(string name = "");
		super.new(name);
	endfunction : new



endclass : result_transaction

      
        
