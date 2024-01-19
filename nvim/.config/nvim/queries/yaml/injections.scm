; script lines
; script:
;  - echo foobar
(
 (block_mapping_pair
   key: (flow_node
	  (plain_scalar
	    (string_scalar) @script_key))
   value: (block_node
	    (block_sequence
	      (block_sequence_item
		    (_) @injection.content))))
 (#any-of? @script_key "before_script" "script" "after_script")
 (#set! injection.language "bash")
 (#set! injection.include-children)
 (#set! injection.self)
)
; values of variables
; variables:
;   - VAR: value
(
(block_mapping_pair
  key: (flow_node
	 (plain_scalar (string_scalar) @variables_key))
  value: (block_node
	   (block_mapping
	     (block_mapping_pair
	       value: (_) @injection.content))))
  (#eq? @variables_key "variables")
  (#set! injection.language "bash")
  (#set! injection.include-children)
  (#set! injection.self)
)
