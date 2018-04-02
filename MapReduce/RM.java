package Rain;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
//import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class RM extends Mapper<LongWritable, Text, Text, Text>{

	@Override
	protected void map(LongWritable key, Text value, Context context)
			throws IOException, InterruptedException {

		String line = value.toString();
		String[] str=line.split(",");
		float sum=0.0f;
		float avg=0.0f;
		//if(str[1] == "CACHAR"){
			for (int i = 6; i < str.length; i++) {
				//if(str[2]==)
				float v=Float.parseFloat(str[i]);
				sum+=v;
				avg+=v/12;
			}
		//}

		
		String s1=String.valueOf((float)sum);
		String s2=String.valueOf((float)avg); 
		context.write(new Text("Sum        "),new Text("Avg         "));

		context.write(new Text(s1),new Text("      "+s2));
		//context.write(new Text("Average "),new Text(s2));
	}
}
