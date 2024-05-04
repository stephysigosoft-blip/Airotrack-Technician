


class Command {
    int id;
    String command;

    Command({
        required this.id,
        required this.command,
    });

    factory Command.fromJson(Map<String, dynamic> json) => Command(
        id: json["id"],
        command: json["command"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "command": command,
    };
}
