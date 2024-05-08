
provider "aws" {
  alias =  "eu-west-3"
  region = "eu-west-3"
}

resource "aws_instance" "instance_eu" {
    provider = aws.eu-west-3
    ami = "ami-0111c5910da90c2a7"
    instance_type = "t2.large"
    tags = {
        Name = "Instance_eu-west-3"
    }
}
provider "aws" {
    alias =  "sa-east-1"
    region = "sa-east-1"  
}
resource "aws_instance" "instance_sa" {
    provider = aws.sa-east-1
    ami =  "ami-0c0039bfde8cbfe27"
    instance_type = "t2.large"
    tags = {
      Name = "Instance_sa-east-1"

    }
}

provider "aws" {
    alias =  "ap-northeast-1"
    region = "ap-northeast-1"
}

resource "aws_instance" "instance_ap" {
    provider = aws.ap-northeast-1
    ami = "ami-0ab3794db9457b60a"
    instance_type = "t2.large"
    tags = {
        Name = "Instance_ap-northeast-1"
    }
}

#Code from here down should not be working properly

resource "null_resource" "sysbench_cpu_eu" {
  depends_on = [aws_instance.instance_eu]

  provisioner "local-exec" {
    command = "sysbench --test=cpu run"
  }
}

resource "null_resource" "sysbench_cpu_sa" {
  depends_on = [aws_instance.instance_sa]

  provisioner "local-exec" {
    command = "sysbench --test=cpu run"
  }
}

resource "null_resource" "sysbench_cpu_ap" {
  depends_on = [aws_instance.instance_ap]

  provisioner "local-exec" {
    command = "sysbench --test=cpu run"
  }
}

resource "null_resource" "sysbench_memory_eu" {
  depends_on = [aws_instance.instance_eu]

  provisioner "local-exec" {
    command = "sysbench --test=memory run"
  }
}

resource "null_resource" "sysbench_memory_sa" {
  depends_on = [aws_instance.instance_sa]

  provisioner "local-exec" {
    command = "sysbench --test=memory run"
  }
}

resource "null_resource" "sysbench_memory_ap" {
  depends_on = [aws_instance.instance_ap]

  provisioner "local-exec" {
    command = "sysbench --test=memory run"
  }
}

resource "null_resource" "sysbench_disk_eu" {
  depends_on = [aws_instance.instance_eu]

  provisioner "local-exec" {
    command = "sysbench --test=fileio --file-test-mode=seqwr run"
  }
}

resource "null_resource" "sysbench_disk_sa" {
  depends_on = [aws_instance.instance_sa]

  provisioner "local-exec" {
    command = "sysbench --test=fileio --file-test-mode=seqwr run"
  }
}

resource "null_resource" "sysbench_disk_ap" {
  depends_on = [aws_instance.instance_ap]

  provisioner "local-exec" {
    command = "sysbench --test=fileio --file-test-mode=seqwr run"
  }
}