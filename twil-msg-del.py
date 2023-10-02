from twilio.rest import Client

# Initialize Twilio Client
account_sid = 'xxx'
auth_token = 'xxx'
client = Client(account_sid, auth_token)

# Fetch all messages
messages = client.messages.list()

# Get the total number of messages
total_messages = len(messages)

# Initialize counter for deleted messages
deleted_messages = 0

# Delete each message
for record in messages:
    client.messages(record.sid).delete()
    deleted_messages += 1
    print(f"Deleted {deleted_messages} of {total_messages} messages.")

# Print finish when done
print("Finished deleting all messages.")
