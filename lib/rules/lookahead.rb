require 'rules/rule'

module Grammy
	module Rules
		class Lookahead < Rule
			attr_reader :rule

			def initialize(name, rule, options = {})
				rule = Rule.to_rule(rule)
				@rule = rule
				@rule.parent = self
				@reverse = !!options.delete(:reverse)
				super(name, options)
			end

			def children
				[@rule]
			end

			def match(context)
				debug_start(context)
				result0 = @rule.match(context)
				result = MatchResult.new(result0.rule, result0.result != @reverse, 
					result0.ast_node, result0.start_pos, result0.end_pos)
				if result.success? != @reverse
					context.position = result0.start_pos
				end
				debug_end(context, result)
				result
			end
			
			def first_set
				rule.first_set
			end

			def to_s
				"!#{@rule.to_s}"
			end

			def to_bnf
				name = @reverse ? "LOOKAHEAD_REVERSE" : "LOOKAHEAD"
				"#{name}(#{@rule.to_bnf})"
			end
		end
	end
end
