package hxgamejolt.data;

import haxe.Json;

@:deprecated("Use GJTable instead")
typedef Table = GJTable;
/**
 * A score table object from the GameJolt API.
 */
class GJTable
{
	/** The ID of the score table. */
	public final id:Int;

	/** The developer-defined name of the score table. */
	public final name:String;

	/** The developer-defined description of the score table. */
	public final description:String;

	/** Whether or not this is the default score table. */
	public final primary:Bool;

	/**
	 * Initialize a score table instance with data from a HTTP request.
	 * 
	 * @param data The object containing data.
	 */
	@:allow(hxgamejolt.GameJolt)
	@:nullSafety(Off)
	private function new(data:Dynamic):Void
	{
		id = Std.parseInt(data.id);
		name = data.name;
		description = data.description;
		primary = data.primary == '1';
	}

	/**
	 * Returns a string representation of the Table object.
	 *
	 * @return A string containing all the properties of the Table object.
	 */
	@:keep
	public function toString():String
	{
		final parts:Array<String> = [];
		parts.push('ID: $id');
		parts.push('Name: $name');
		parts.push('Description: $description');
		parts.push('Primary: $primary');
		return parts.join('\n');
	}

	/**
	 * Returns a JSON representation of the Table object.
	 *
	 * @return A string containing all the JSON properties of the Table object.
	 */
	@:keep
	public function toJson():String
	{
		return Json.stringify({
			id: id,
			name: name,
			description: description,
			primary: primary // https://gamejolt.com/game-api/doc/scores/tables says primary:Bool even tho you used (data.primary == '1') so i'll just follow gamejolt
		});
	}
}
