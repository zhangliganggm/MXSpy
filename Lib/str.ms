__author__ = 'ACE'

/*

Python os lib

*/

struct MXSstr
(
	source_text = "",
	
	fn lower = (
		return toLower source_text
	),
	
	fn upper = (
		return toUpper source_text
	),
	
	fn join str_lst = (
		new_str = ""
		for a in str_lst do(
			new_str += a + source_text
		)
		return new_str
	),
	
	fn split split_text split_count:undefined = (
		text_lst = #()
		current_text = ""
		split_count_index = 0

		for a in 1 to source_text.count do(
			t = source_text[a]
			
			if t == split_text then(
				split_count_index += 1
				if split_count != undefined do(
					if split_count_index > split_count do(
						continue
					)
				)
				append text_lst current_text
				current_text = ""

			)else(
				current_text += t
			)
		)
		if current_text != "" and split_count == undefined do(
			append text_lst current_text
		)
		return text_lst
	)
)
