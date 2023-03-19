function AddNewVariation(which, gender, one, two, single)
	local Where = Variations[which][gender]
	if not single then
		Where[one] = two
		Where[two] = one
	else
		Where[one] = two
	end
end

--[[
		This is where all the different variations go.
		For jackets i included extra things that arent just hoodies aswell, things like the christmas sweater with their different lights.
		So doing the command whilst wearing the christmas sweater you can toggle the light.

		Tip for adding new ones of this is to toggle Config.Debug, and use vMenu Player Appearance to switch around.

		If you are using EUP you might have to change things around!
		But it should be easy enough to understand and make changes as you want.

		Simply just : 

		AddNewVariation(Table, Gender, First, Second)

		And for Hair there is also the "single" var.
		Its important for haircuts.
]]--

Citizen.CreateThread(function()
	-- Male Visor/Hat Variations
	AddNewVariation("Visor", "Male", 65, 66)
	AddNewVariation("Visor", "Male", 66, 65)
	AddNewVariation("Visor", "Male", 53, 69)
	AddNewVariation("Visor", "Male", 69, 53)
	AddNewVariation("Visor", "Male", 73, 74)
	AddNewVariation("Visor", "Male", 74, 73)
	AddNewVariation("Visor", "Male", 76, 77)
	AddNewVariation("Visor", "Male", 77, 76)
	AddNewVariation("Visor", "Male", 78, 79)
	AddNewVariation("Visor", "Male", 79, 78)
	AddNewVariation("Visor", "Male", 91, 92)
	AddNewVariation("Visor", "Male", 92, 91)
	AddNewVariation("Visor", "Male", 109, 110)
	AddNewVariation("Visor", "Male", 110, 109)
	AddNewVariation("Visor", "Male", 116, 117)
	AddNewVariation("Visor", "Male", 117, 116)
	AddNewVariation("Visor", "Male", 118, 119)
	AddNewVariation("Visor", "Male", 119, 118)
	AddNewVariation("Visor", "Male", 123, 124)
	AddNewVariation("Visor", "Male", 124, 123)
	AddNewVariation("Visor", "Male", 125, 126)
	AddNewVariation("Visor", "Male", 126, 125)
	AddNewVariation("Visor", "Male", 127, 128)
	AddNewVariation("Visor", "Male", 128, 127)
	AddNewVariation("Visor", "Male", 130, 131)
	AddNewVariation("Visor", "Male", 131, 130)
	AddNewVariation("Visor", "Male", 135, 136)
	AddNewVariation("Visor", "Male", 136, 135)
	AddNewVariation("Visor", "Male", 139, 140)
	AddNewVariation("Visor", "Male", 140, 139)
	AddNewVariation("Visor", "Male", 142, 143)
	AddNewVariation("Visor", "Male", 143, 142)
	AddNewVariation("Visor", "Male", 147, 148)
	AddNewVariation("Visor", "Male", 148, 147)
	AddNewVariation("Visor", "Male", 151, 152)
	AddNewVariation("Visor", "Male", 152, 151)
	AddNewVariation("Visor", "Male", 158, 159)
	AddNewVariation("Visor", "Male", 159, 158)
	
	-- Female Visor/Hat Variations
	AddNewVariation("Visor", "Female", 49, 50)
	AddNewVariation("Visor", "Female", 55, 73)
	AddNewVariation("Visor", "Female", 56, 74)
	AddNewVariation("Visor", "Female", 57, 75)
	AddNewVariation("Visor", "Female", 58, 76)
	AddNewVariation("Visor", "Female", 70, 71)
	AddNewVariation("Visor", "Female", 83, 84)
	AddNewVariation("Visor", "Female", 85, 86)
	AddNewVariation("Visor", "Female", 96, 97)
	AddNewVariation("Visor", "Female", 114, 115)
	AddNewVariation("Visor", "Female", 128, 129)
	AddNewVariation("Visor", "Female", 130, 131)
	AddNewVariation("Visor", "Female", 133, 132)
	AddNewVariation("Visor", "Female", 135, 136)
	AddNewVariation("Visor", "Female", 147, 148)
	AddNewVariation("Visor", "Female", 152, 153)
	AddNewVariation("Visor", "Female", 156, 157)
	AddNewVariation("Visor", "Female", 149, 233)
	-- Male Bags
	AddNewVariation("Bags", "Male", 45, 44)
	AddNewVariation("Bags", "Male", 41, 40)
	-- Female Bags
	AddNewVariation("Bags", "Female", 45, 44)
	AddNewVariation("Bags", "Female", 41, 40)
	-- Male Hair
    AddNewVariation("Hair", "Male", 1, 37, true)
	AddNewVariation("Hair", "Male", 2, 11, true)
	AddNewVariation("Hair", "Male", 3, 75, true)
	AddNewVariation("Hair", "Male", 4, 19, true)
	AddNewVariation("Hair", "Male", 5, 9, true)
	AddNewVariation("Hair", "Male", 6, 147, true)
	AddNewVariation("Hair", "Male", 7, 15, true)
	AddNewVariation("Hair", "Male", 9, 5, true)
	AddNewVariation("Hair", "Male", 10, 19, true)
	AddNewVariation("Hair", "Male", 11, 13, true)
	AddNewVariation("Hair", "Male",12, 35, true)
	AddNewVariation("Hair", "Male", 13, 82, true)
	AddNewVariation("Hair", "Male", 14, 113, true)
	AddNewVariation("Hair", "Male", 15, 7, true)
	AddNewVariation("Hair", "Male", 16, 17, true)
	AddNewVariation("Hair", "Male", 17, 16, true)
	AddNewVariation("Hair", "Male", 18, 19, true)
	AddNewVariation("Hair", "Male", 19, 10, true)
	AddNewVariation("Hair", "Male", 21, 140, true)
	AddNewVariation("Hair", "Male", 24, 29, true)
	AddNewVariation("Hair", "Male", 25, 28, true)
	AddNewVariation("Hair", "Male", 26, 27, true)
	AddNewVariation("Hair", "Male", 27, 28, true)
	AddNewVariation("Hair", "Male", 28, 25, true)
	AddNewVariation("Hair", "Male", 29, 24, true)
	AddNewVariation("Hair", "Male", 31, 43, true)
	AddNewVariation("Hair", "Male", 32, 33, true)
	AddNewVariation("Hair", "Male", 33, 32, true)
	AddNewVariation("Hair", "Male", 35, 12, true)
	AddNewVariation("Hair", "Male", 37, 73, true)
	AddNewVariation("Hair", "Male", 38, 47, true)
	AddNewVariation("Hair", "Male", 39, 75, true)
	AddNewVariation("Hair", "Male", 40, 46, true)
	AddNewVariation("Hair", "Male", 41, 45, true)
	AddNewVariation("Hair", "Male", 42, 147, true)
	AddNewVariation("Hair", "Male", 43, 31, true)
	AddNewVariation("Hair", "Male", 45, 41, true)
	AddNewVariation("Hair", "Male", 46, 55, true)
	AddNewVariation("Hair", "Male", 47, 38, true)
	AddNewVariation("Hair", "Male", 49, 82, true)
	AddNewVariation("Hair", "Male", 50, 140, true)
	AddNewVariation("Hair", "Male", 51, 7, true)
	AddNewVariation("Hair", "Male", 52, 53, true)
	AddNewVariation("Hair", "Male", 53, 52, true)
	AddNewVariation("Hair", "Male", 54, 81, true)
	AddNewVariation("Hair", "Male", 55, 46, true)
	AddNewVariation("Hair", "Male", 59, 64, true)
	AddNewVariation("Hair", "Male", 60, 63, true)
	AddNewVariation("Hair", "Male", 61, 62, true)
	AddNewVariation("Hair", "Male", 62, 61, true)
	AddNewVariation("Hair", "Male", 63, 60, true)
	AddNewVariation("Hair", "Male", 64, 59, true)
	AddNewVariation("Hair", "Male", 65, 72, true)
	AddNewVariation("Hair", "Male", 67, 68, true)
	AddNewVariation("Hair", "Male", 68, 67, true)
	AddNewVariation("Hair", "Male", 71, 65, true)
	AddNewVariation("Hair", "Male", 73, 1, true)
	AddNewVariation("Hair", "Male", 75, 0, true)
	AddNewVariation("Hair", "Male", 76, 77, true)
	AddNewVariation("Hair", "Male", 77, 76, true)
	AddNewVariation("Hair", "Male", 78, 79, true)
	AddNewVariation("Hair", "Male", 79, 78, true)
	AddNewVariation("Hair", "Male", 80, 108, true)
	AddNewVariation("Hair", "Male", 81, 89, true)
	AddNewVariation("Hair", "Male", 84, 85, true)
	AddNewVariation("Hair", "Male", 85, 84, true)
	AddNewVariation("Hair", "Male", 87, 89, true)
	AddNewVariation("Hair", "Male", 89, 90, true)
	AddNewVariation("Hair", "Male", 90, 89, true)
	AddNewVariation("Hair", "Male", 97, 98, true)
	AddNewVariation("Hair", "Male", 98, 97, true)
	AddNewVariation("Hair", "Male", 103, 141, true)
	AddNewVariation("Hair", "Male", 104, 106, true)
	AddNewVariation("Hair", "Male", 105, 107, true)
	AddNewVariation("Hair", "Male", 106, 104, true)
	AddNewVariation("Hair", "Male", 107, 105, true)
	AddNewVariation("Hair", "Male", 108, 80, true)
	AddNewVariation("Hair", "Male", 109, 110, true)
	AddNewVariation("Hair", "Male", 110, 109, true)
	AddNewVariation("Hair", "Male", 113, 14, true)
	AddNewVariation("Hair", "Male", 115, 146, true)
	AddNewVariation("Hair", "Male", 117, 118, true)
	AddNewVariation("Hair", "Male", 118, 117, true)
	AddNewVariation("Hair", "Male", 124, 1, true)
	AddNewVariation("Hair", "Male", 123, 3, true)
	AddNewVariation("Hair", "Male", 125, 126, true)
	AddNewVariation("Hair", "Male", 126, 125, true)
	AddNewVariation("Hair", "Male", 129, 130, true)
	AddNewVariation("Hair", "Male", 130, 129, true)
	AddNewVariation("Hair", "Male", 139, 31, true)
	AddNewVariation("Hair", "Male", 140, 50, true)
	AddNewVariation("Hair", "Male", 141, 103, true)
	AddNewVariation("Hair", "Male", 142, 143, true)
	AddNewVariation("Hair", "Male", 143, 142, true)
	
	-- Female Hair
	AddNewVariation("Hair", "Female", 81, 118)
	AddNewVariation("Hair", "Female", 82, 118) 
	AddNewVariation("Hair", "Female", 83, 118) 
	AddNewVariation("Hair", "Female", 84, 118)
	AddNewVariation("Hair", "Female", 85, 115)   
	AddNewVariation("Hair", "Female", 86, 223) 
	AddNewVariation("Hair", "Female", 87, 235) 
	AddNewVariation("Hair", "Female", 88, 237)
	AddNewVariation("Hair", "Female", 89, 233) 
	AddNewVariation("Hair", "Female", 90, 241) 
	AddNewVariation("Hair", "Female", 91, 240) 
	AddNewVariation("Hair", "Female", 92, 214) 
	AddNewVariation("Hair", "Female", 93, 116)   
	AddNewVariation("Hair", "Female", 94, 117) 
	AddNewVariation("Hair", "Female", 95, 118) 
	AddNewVariation("Hair", "Female", 96, 96) 
	AddNewVariation("Hair", "Female", 97, 115)
	AddNewVariation("Hair", "Female", 98, 225)
	AddNewVariation("Hair", "Female", 99, 222)
	AddNewVariation("Hair", "Female", 100, 222)
	AddNewVariation("Hair", "Female", 101, 106)
	AddNewVariation("Hair", "Female", 102, 116)
	AddNewVariation("Hair", "Female", 103, 228)
	AddNewVariation("Hair", "Female", 104, 228)
	AddNewVariation("Hair", "Female", 105, 91)
	AddNewVariation("Hair", "Female", 106, 95)
	AddNewVariation("Hair", "Female", 108, 234)
	AddNewVariation("Hair", "Female", 109, 228)
	AddNewVariation("Hair", "Female", 110, 228)
	AddNewVariation("Hair", "Female", 111, 237)
	AddNewVariation("Hair", "Female", 112, 247)
	AddNewVariation("Hair", "Female", 113, 91)
	AddNewVariation("Hair", "Female", 114, 203)
	AddNewVariation("Hair", "Female", 115, 135)
	AddNewVariation("Hair", "Female", 116, 146)
	AddNewVariation("Hair", "Female", 117, 213)
	AddNewVariation("Hair", "Female", 118, 138)
	AddNewVariation("Hair", "Female", 119, 140)
	AddNewVariation("Hair", "Female", 120, 152)
	AddNewVariation("Hair", "Female", 121, 147)
	AddNewVariation("Hair", "Female", 122, 262)
	AddNewVariation("Hair", "Female", 123, 257)
	AddNewVariation("Hair", "Female", 124, 127)
	AddNewVariation("Hair", "Female", 125, 235)
	AddNewVariation("Hair", "Female", 126, 178)
	AddNewVariation("Hair", "Female", 127, 109)
	AddNewVariation("Hair", "Female", 128, 89)
	AddNewVariation("Hair", "Female", 129, 272)
	AddNewVariation("Hair", "Female", 130, 84)
	AddNewVariation("Hair", "Female", 131, 245)
	AddNewVariation("Hair", "Female", 132, 110)
	AddNewVariation("Hair", "Female", 133, 111)
	AddNewVariation("Hair", "Female", 134, 174)
	AddNewVariation("Hair", "Female", 135, 115)
	AddNewVariation("Hair", "Female", 136, 211)
	AddNewVariation("Hair", "Female", 137, 242)
	AddNewVariation("Hair", "Female", 138, 118)
	AddNewVariation("Hair", "Female", 139, 242)
	AddNewVariation("Hair", "Female", 140, 119)
	AddNewVariation("Hair", "Female", 141, 174)   
	AddNewVariation("Hair", "Female", 142, 217)
	AddNewVariation("Hair", "Female", 143, 170)
	AddNewVariation("Hair", "Female", 144, 242)
	AddNewVariation("Hair", "Female", 145, 224)
	AddNewVariation("Hair", "Female", 146, 116)
	AddNewVariation("Hair", "Female", 147, 121)
	AddNewVariation("Hair", "Female", 148, 241)
	AddNewVariation("Hair", "Female", 149, 150)
	AddNewVariation("Hair", "Female", 150, 149)
	AddNewVariation("Hair", "Female", 151, 295)  
	AddNewVariation("Hair", "Female", 152, 120)
	AddNewVariation("Hair", "Female", 153, 201)
	AddNewVariation("Hair", "Female", 154, 300)
	AddNewVariation("Hair", "Female", 155, 171)
	AddNewVariation("Hair", "Female", 156, 271)
	AddNewVariation("Hair", "Female", 157, 238)
	AddNewVariation("Hair", "Female", 158, 107)
	AddNewVariation("Hair", "Female", 159, 261)
	AddNewVariation("Hair", "Female", 160, 214)
	AddNewVariation("Hair", "Female", 161, 276)
	AddNewVariation("Hair", "Female", 162, 286)
	AddNewVariation("Hair", "Female", 163, 243)
	AddNewVariation("Hair", "Female", 164, 285)
	AddNewVariation("Hair", "Female", 165, 295)
	AddNewVariation("Hair", "Female", 166, 103)
	AddNewVariation("Hair", "Female", 167, 228)
	AddNewVariation("Hair", "Female", 168, 99)
	AddNewVariation("Hair", "Female", 169, 211)
	AddNewVariation("Hair", "Female", 171, 155)
	AddNewVariation("Hair", "Female", 172, 183)
	AddNewVariation("Hair", "Female", 173, 174)
	AddNewVariation("Hair", "Female", 174, 141)
	AddNewVariation("Hair", "Female", 175, 287)
	AddNewVariation("Hair", "Female", 176, 259)
	AddNewVariation("Hair", "Female", 177, 243)
	AddNewVariation("Hair", "Female", 178, 126)
	AddNewVariation("Hair", "Female", 179, 189)
	AddNewVariation("Hair", "Female", 180, 238)
	AddNewVariation("Hair", "Female", 181, 182)
	AddNewVariation("Hair", "Female", 182, 181)
	AddNewVariation("Hair", "Female", 183, 197)
	AddNewVariation("Hair", "Female", 184, 216)
	AddNewVariation("Hair", "Female", 186, 213)
	AddNewVariation("Hair", "Female", 187, 228)
	AddNewVariation("Hair", "Female", 188, 191)
	AddNewVariation("Hair", "Female", 189, 179)
	AddNewVariation("Hair", "Female", 190, 235)
	AddNewVariation("Hair", "Female", 191, 188)
	AddNewVariation("Hair", "Female", 192, 222)
	AddNewVariation("Hair", "Female", 193, 205)
	AddNewVariation("Hair", "Female", 194, 101)
	AddNewVariation("Hair", "Female", 195, 283)
	AddNewVariation("Hair", "Female", 196, 298)
	AddNewVariation("Hair", "Female", 197, 183)
	AddNewVariation("Hair", "Female", 198, 108)
	AddNewVariation("Hair", "Female", 200, 170)
	AddNewVariation("Hair", "Female", 201, 153)
	AddNewVariation("Hair", "Female", 203, 104)
	AddNewVariation("Hair", "Female", 204, 247)
	AddNewVariation("Hair", "Female", 205, 193)
	AddNewVariation("Hair", "Female", 206, 212)
	AddNewVariation("Hair", "Female", 208, 210)
	AddNewVariation("Hair", "Female", 209, 283)
	AddNewVariation("Hair", "Female", 210, 238)
	AddNewVariation("Hair", "Female", 211, 136)
	AddNewVariation("Hair", "Female", 212, 206)
	AddNewVariation("Hair", "Female", 213, 186)
	AddNewVariation("Hair", "Female", 214, 160)
	AddNewVariation("Hair", "Female", 215, 223)
	AddNewVariation("Hair", "Female", 216, 205)
	AddNewVariation("Hair", "Female", 217, 142)
	AddNewVariation("Hair", "Female", 218, 259)
	AddNewVariation("Hair", "Female", 219, 301)
	AddNewVariation("Hair", "Female", 220, 251)
	AddNewVariation("Hair", "Female", 221, 242)
	AddNewVariation("Hair", "Female", 222, 192)
	AddNewVariation("Hair", "Female", 223, 215)
	AddNewVariation("Hair", "Female", 224, 145)
	AddNewVariation("Hair", "Female", 225, 253)
	AddNewVariation("Hair", "Female", 226, 254)
	AddNewVariation("Hair", "Female", 227, 255)
	AddNewVariation("Hair", "Female", 228, 287)
	AddNewVariation("Hair", "Female", 229, 260)
	AddNewVariation("Hair", "Female", 230, 106)
	AddNewVariation("Hair", "Female", 231, 227)
	AddNewVariation("Hair", "Female", 232, 234)
	AddNewVariation("Hair", "Female", 233, 172)
	AddNewVariation("Hair", "Female", 234, 232)
	AddNewVariation("Hair", "Female", 235, 125)
	AddNewVariation("Hair", "Female", 236, 240)
	AddNewVariation("Hair", "Female", 237, 249)
	AddNewVariation("Hair", "Female", 238, 157)
	AddNewVariation("Hair", "Female", 239, 279)
	AddNewVariation("Hair", "Female", 240, 236)
	AddNewVariation("Hair", "Female", 241, 148)
	AddNewVariation("Hair", "Female", 242, 139)
	AddNewVariation("Hair", "Female", 243, 163)
	AddNewVariation("Hair", "Female", 244, 299)
	AddNewVariation("Hair", "Female", 245, 131)
	AddNewVariation("Hair", "Female", 246, 259)
	AddNewVariation("Hair", "Female", 247, 204)
	AddNewVariation("Hair", "Female", 248, 277)
	AddNewVariation("Hair", "Female", 249, 237)
	AddNewVariation("Hair", "Female", 250, 254)
	AddNewVariation("Hair", "Female", 251, 267)
	AddNewVariation("Hair", "Female", 252, 268)
	AddNewVariation("Hair", "Female", 253, 225)
	AddNewVariation("Hair", "Female", 254, 226)
	AddNewVariation("Hair", "Female", 255, 227)
	AddNewVariation("Hair", "Female", 257, 292)
	AddNewVariation("Hair", "Female", 258, 295)
	AddNewVariation("Hair", "Female", 259, 218)
	AddNewVariation("Hair", "Female", 260, 123)
	AddNewVariation("Hair", "Female", 261, 159)
	AddNewVariation("Hair", "Female", 262, 122)
	AddNewVariation("Hair", "Female", 263, 270)
	AddNewVariation("Hair", "Female", 264, 273)
	AddNewVariation("Hair", "Female", 267, 251)
	AddNewVariation("Hair", "Female", 268, 80)
	AddNewVariation("Hair", "Female", 269, 274)
	AddNewVariation("Hair", "Female", 270, 263)
	AddNewVariation("Hair", "Female", 271, 156)
	AddNewVariation("Hair", "Female", 272, 225)
	AddNewVariation("Hair", "Female", 273, 264)
	AddNewVariation("Hair", "Female", 274, 269)
	AddNewVariation("Hair", "Female", 275, 278)
	AddNewVariation("Hair", "Female", 276, 161)
	AddNewVariation("Hair", "Female", 277, 248)
	AddNewVariation("Hair", "Female", 278, 275)
	AddNewVariation("Hair", "Female", 279, 239)
	AddNewVariation("Hair", "Female", 280, 203)
	AddNewVariation("Hair", "Female", 281, 251)
	AddNewVariation("Hair", "Female", 282, 286)
	AddNewVariation("Hair", "Female", 283, 195)
	AddNewVariation("Hair", "Female", 284, 293)
	AddNewVariation("Hair", "Female", 285, 164)
	AddNewVariation("Hair", "Female", 286, 282)
	AddNewVariation("Hair", "Female", 287, 175)
	AddNewVariation("Hair", "Female", 288, 192)
	AddNewVariation("Hair", "Female", 290, 252)
	AddNewVariation("Hair", "Female", 291, 210)
	AddNewVariation("Hair", "Female", 292, 257)
	AddNewVariation("Hair", "Female", 293, 284)
	AddNewVariation("Hair", "Female", 294, 258)
	AddNewVariation("Hair", "Female", 295, 151)
	AddNewVariation("Hair", "Female", 296, 298)
	AddNewVariation("Hair", "Female", 297, 168)
	AddNewVariation("Hair", "Female", 298, 296)
	AddNewVariation("Hair", "Female", 299, 244)
	AddNewVariation("Hair", "Female", 300, 154)
	AddNewVariation("Hair", "Female", 301, 219)
		
	-- Male Top/Jacket Variations
	AddNewVariation("Jackets", "Male", 38, 39)
	AddNewVariation("Jackets", "Male", 40, 41) 
	AddNewVariation("Jackets", "Male", 117, 118)
	AddNewVariation("Jackets", "Male", 119, 120)
	AddNewVariation("Jackets", "Male", 130, 131)
	AddNewVariation("Jackets", "Male", 147, 148)
	AddNewVariation("Jackets", "Male", 156, 157)
	AddNewVariation("Jackets", "Male", 157, 156)
	AddNewVariation("Jackets", "Male", 287, 188)
	AddNewVariation("Jackets", "Male", 189, 190)
	AddNewVariation("Jackets", "Male", 191, 192)
	AddNewVariation("Jackets", "Male", 214, 215)
	AddNewVariation("Jackets", "Male", 272, 273)
	AddNewVariation("Jackets", "Male", 276, 277)
	AddNewVariation("Jackets", "Male", 290, 293)
	AddNewVariation("Jackets", "Male", 293, 290)
	AddNewVariation("Jackets", "Male", 294, 295)
	AddNewVariation("Jackets", "Male", 297, 298)
	AddNewVariation("Jackets", "Male", 298, 300)
	AddNewVariation("Jackets", "Male", 305, 306)
	AddNewVariation("Jackets", "Male", 309, 310)
	AddNewVariation("Jackets", "Male", 317, 318)
	AddNewVariation("Jackets", "Male", 320, 321)
	AddNewVariation("Jackets", "Male", 339, 341)
	AddNewVariation("Jackets", "Male", 350, 351)
	AddNewVariation("Jackets", "Male", 353, 354)
	AddNewVariation("Jackets", "Male", 355, 356)
	AddNewVariation("Jackets", "Male", 380, 381)
	AddNewVariation("Jackets", "Male", 382, 383)
	AddNewVariation("Jackets", "Male", 384, 385)
	AddNewVariation("Jackets", "Male", 388, 389)
	AddNewVariation("Jackets", "Male", 389, 391)
	AddNewVariation("Jackets", "Male", 399, 400)
	AddNewVariation("Jackets", "Male", 402, 403)
	AddNewVariation("Jackets", "Male", 404, 405)
	AddNewVariation("Jackets", "Male", 406, 407)
	AddNewVariation("Jackets", "Male", 409, 410)
	AddNewVariation("Jackets", "Male", 418, 419)
	AddNewVariation("Jackets", "Male", 279, 425)
	AddNewVariation("Jackets", "Male", 428, 429)
	AddNewVariation("Jackets", "Male", 436, 437)
	AddNewVariation("Jackets", "Male", 440, 441)
	AddNewVariation("Jackets", "Male", 442, 443)
	AddNewVariation("Jackets", "Male", 447, 448)
	-- Female Top/Jacket Variations
	AddNewVariation("Jackets", "Female", 164, 165)
	AddNewVariation("Jackets", "Female", 169, 170) 
	AddNewVariation("Jackets", "Female", 202, 203)  
	AddNewVariation("Jackets", "Female", 206, 207) 
	AddNewVariation("Jackets", "Female", 298, 299)
	AddNewVariation("Jackets", "Female", 302, 303) 
	AddNewVariation("Jackets", "Female", 326, 327) 
	AddNewVariation("Jackets", "Female", 339, 340) 
	AddNewVariation("Jackets", "Female", 354, 355) 
	AddNewVariation("Jackets", "Female", 371, 373) 
	AddNewVariation("Jackets", "Female", 383, 384) 
	AddNewVariation("Jackets", "Female", 388, 389) 
	AddNewVariation("Jackets", "Female", 417, 418) 
	AddNewVariation("Jackets", "Female", 419, 420)
	AddNewVariation("Jackets", "Female", 424, 425) 
	AddNewVariation("Jackets", "Female", 425, 426) 
	AddNewVariation("Jackets", "Female", 428, 429) 
	AddNewVariation("Jackets", "Female", 437, 438) 
	AddNewVariation("Jackets", "Female", 439, 440) 
	AddNewVariation("Jackets", "Female", 441, 442) 
	AddNewVariation("Jackets", "Female", 444, 445) 
	AddNewVariation("Jackets", "Female", 451, 452) 
	AddNewVariation("Jackets", "Female", 457, 458) 
	AddNewVariation("Jackets", "Female", 463, 364) 
	AddNewVariation("Jackets", "Female", 467, 468) 
	AddNewVariation("Jackets", "Female", 474, 475)
	AddNewVariation("Jackets", "Female", 478, 479)
	AddNewVariation("Jackets", "Female", 482, 483) 
	AddNewVariation("Jackets", "Female", 484, 485) 
	AddNewVariation("Jackets", "Female", 490, 491)
end)

-- And this is the master table, i put it down here since it has all the glove variations, and thats quite the eyesore.
-- You probably dont wanna touch anything down here really.
-- I generated these glove ones with a tool i made, im pretty certain its accurate, there might be native function for this.
-- If there is i wish i knew of it before i spent hours doing it this way.

Variations = {
	Jackets = {Male = {}, Female = {}},
	Hair = {Male = {}, Female = {}},
	Bags = {Male = {}, Female = {}},
	Visor = {Male = {}, Female = {}},
	Gloves = {
		Male = {
			[16] = 4,
			[17] = 4,
			[18] = 4,
			[19] = 0,
			[20] = 1,
			[21] = 2,
			[22] = 4,
			[23] = 5,
			[24] = 6,
			[25] = 8,
			[26] = 11,
			[27] = 12,
			[28] = 14,
			[29] = 15,
			[30] = 0,
			[31] = 1,
			[32] = 2,
			[33] = 4,
			[34] = 5,
			[35] = 6,
			[36] = 8,
			[37] = 11,
			[38] = 12,
			[39] = 14,
			[40] = 15,
			[41] = 0,
			[42] = 1,
			[43] = 2,
			[44] = 4,
			[45] = 5,
			[46] = 6,
			[47] = 8,
			[48] = 11,
			[49] = 12,
			[50] = 14,
			[51] = 15,
			[52] = 0,
			[53] = 1,
			[54] = 2,
			[55] = 4,
			[56] = 5,
			[57] = 6,
			[58] = 8,
			[59] = 11,
			[60] = 12,
			[61] = 14,
			[62] = 15,
			[63] = 0,
			[64] = 1,
			[65] = 2,
			[66] = 4,
			[67] = 5,
			[68] = 6,
			[69] = 8,
			[70] = 11,
			[71] = 12,
			[72] = 14,
			[73] = 15,
			[74] = 0,
			[75] = 1,
			[76] = 2,
			[77] = 4,
			[78] = 5,
			[79] = 6,
			[80] = 8,
			[81] = 11,
			[82] = 12,
			[83] = 14,
			[84] = 15,
			[85] = 0,
			[86] = 1,
			[87] = 2,
			[88] = 4,
			[89] = 5,
			[90] = 6,
			[91] = 8,
			[92] = 11,
			[93] = 12,
			[94] = 14,
			[95] = 15,
			[96] = 4,
			[97] = 4,
			[98] = 4,
			[99] = 0,
			[100] = 1,
			[101] = 2,
			[102] = 4,
			[103] = 5,
			[104] = 6,
			[105] = 8,
			[106] = 11,
			[107] = 12,
			[108] = 14,
			[109] = 15,
			[110] = 4,
			[111] = 4,
			[115] = 112,
			[116] = 112,
			[117] = 112,
			[118] = 112,
			[119] = 112,
			[120] = 112,
			[121] = 112,
			[122] = 113,
			[123] = 113,
			[124] = 113,
			[125] = 113,
			[126] = 113,
			[127] = 113,
			[128] = 113,
			[129] = 114,
			[130] = 114,
			[131] = 114,
			[132] = 114,
			[133] = 114,
			[134] = 114,
			[135] = 114,
			[136] = 15,
			[137] = 15,
			[138] = 0,
			[139] = 1,
			[140] = 2,
			[141] = 4,
			[142] = 5,
			[143] = 6,
			[144] = 8,
			[145] = 11,
			[146] = 12,
			[147] = 14,
			[148] = 112,
			[149] = 113,
			[150] = 114,
			[151] = 0,
			[152] = 1,
			[153] = 2,
			[154] = 4,
			[155] = 5,
			[156] = 6,
			[157] = 8,
			[158] = 11,
			[159] = 12,
			[160] = 14,
			[161] = 112,
			[162] = 113,
			[163] = 114,
			[165] = 4,
			[166] = 4,
			[167] = 4,
		},
		Female = {
			[16] = 11,
			[17] = 3,
			[18] = 3,
			[19] = 3,
			[20] = 0,
			[21] = 1,
			[22] = 2,
			[23] = 3,
			[24] = 4,
			[25] = 5,
			[26] = 6,
			[27] = 7,
			[28] = 9,
			[29] = 11,
			[30] = 12,
			[31] = 14,
			[32] = 15,
			[33] = 0,
			[34] = 1,
			[35] = 2,
			[36] = 3,
			[37] = 4,
			[38] = 5,
			[39] = 6,
			[40] = 7,
			[41] = 9,
			[42] = 11,
			[43] = 12,
			[44] = 14,
			[45] = 15,
			[46] = 0,
			[47] = 1,
			[48] = 2,
			[49] = 3,
			[50] = 4,
			[51] = 5,
			[52] = 6,
			[53] = 7,
			[54] = 9,
			[55] = 11,
			[56] = 12,
			[57] = 14,
			[58] = 15,
			[59] = 0,
			[60] = 1,
			[61] = 2,
			[62] = 3,
			[63] = 4,
			[64] = 5,
			[65] = 6,
			[66] = 7,
			[67] = 9,
			[68] = 11,
			[69] = 12,
			[70] = 14,
			[71] = 15,
			[72] = 0,
			[73] = 1,
			[74] = 2,
			[75] = 3,
			[76] = 4,
			[77] = 5,
			[78] = 6,
			[79] = 7,
			[80] = 9,
			[81] = 11,
			[82] = 12,
			[83] = 14,
			[84] = 15,
			[85] = 0,
			[86] = 1,
			[87] = 2,
			[88] = 3,
			[89] = 4,
			[90] = 5,
			[91] = 6,
			[92] = 7,
			[93] = 9,
			[94] = 11,
			[95] = 12,
			[96] = 14,
			[97] = 15,
			[98] = 0,
			[99] = 1,
			[100] = 2,
			[101] = 3,
			[102] = 4,
			[103] = 5,
			[104] = 6,
			[105] = 7,
			[106] = 9,
			[107] = 11,
			[108] = 12,
			[109] = 14,
			[110] = 15,
			[111] = 3,
			[112] = 3,
			[113] = 3,
			[114] = 0,
			[115] = 1,
			[116] = 2,
			[117] = 3,
			[118] = 4,
			[119] = 5,
			[120] = 6,
			[121] = 7,
			[122] = 9,
			[123] = 11,
			[124] = 12,
			[125] = 14,
			[126] = 15,
			[127] = 3,
			[128] = 3,
			[132] = 129,
			[133] = 129,
			[134] = 129,
			[135] = 129,
			[136] = 129,
			[137] = 129,
			[138] = 129,
			[139] = 130,
			[140] = 130,
			[141] = 130,
			[142] = 130,
			[143] = 130,
			[144] = 130,
			[145] = 130,
			[146] = 131,
			[147] = 131,
			[148] = 131,
			[149] = 131,
			[150] = 131,
			[151] = 131,
			[152] = 131,
			[154] = 153,
			[155] = 153,
			[156] = 153,
			[157] = 153,
			[158] = 153,
			[159] = 153,
			[160] = 153,
			[162] = 161,
			[163] = 161,
			[164] = 161,
			[165] = 161,
			[166] = 161,
			[167] = 161,
			[168] = 161,
			[169] = 15,
			[170] = 15,
			[171] = 0,
			[172] = 1,
			[173] = 2,
			[174] = 3,
			[175] = 4,
			[176] = 5,
			[177] = 6,
			[178] = 7,
			[179] = 9,
			[180] = 11,
			[181] = 12,
			[182] = 14,
			[183] = 129,
			[184] = 130,
			[185] = 131,
			[186] = 153,
			[187] = 0,
			[188] = 1,
			[189] = 2,
			[190] = 3,
			[191] = 4,
			[192] = 5,
			[193] = 6,
			[194] = 7,
			[195] = 9,
			[196] = 11,
			[197] = 12,
			[198] = 14,
			[199] = 129,
			[200] = 130,
			[201] = 131,
			[202] = 153,
			[203] = 161,
			[204] = 161,
			[206] = 3,
			[207] = 3,
			[208] = 3,
		}
	}
}