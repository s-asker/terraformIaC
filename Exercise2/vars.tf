variable REGION {
    default = "us-east-2"
}

variable ZONE1 {
    default = "us-east-2a"
}

variable AMIS {
    type = map
    default = {
        us-east-1 = "ami-0fff1b9a61dec8a5f"
        us-east-2 = "ami-09da212cf18033880"
    }
}

