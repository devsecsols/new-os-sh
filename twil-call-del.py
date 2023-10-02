from twilio.rest import Client

# Initialize Twilio Client
account_sid = 'xxxx'
auth_token = 'xxx'
client = Client(account_sid, auth_token)

# Fetch all calls
calls = client.calls.list()

# Get the total number of calls
total_calls = len(calls)

# Initialize counter for deleted calls
deleted_calls = 0

# Delete each call
for record in calls:
    client.calls(record.sid).delete()
    deleted_calls += 1
    print(f"Deleted {deleted_calls} of {total_calls} calls.")

# Print finish when done
print("Finished deleting all calls.")
