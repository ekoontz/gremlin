package com.tinkerpop.gremlin.functions.g.util;

import com.tinkerpop.gremlin.functions.Function;
import com.tinkerpop.gremlin.functions.FunctionHelper;
import com.tinkerpop.gremlin.functions.g.GremlinFunctionLibrary;
import com.tinkerpop.gremlin.statements.EvaluationException;
import org.apache.commons.jxpath.ExpressionContext;

/**
 * @author Marko A. Rodriguez (http://markorodriguez.com)
 */
public class TimeFunction implements Function {

    public static final String FUNCTION_NAME = "time";

    public Number invoke(final ExpressionContext context, final Object[] parameters) {

        if (null == parameters) {
            return new Long(System.currentTimeMillis()).doubleValue();
        } else if (parameters.length == 1) {
            Object object = FunctionHelper.nodeSetConversion(parameters[0]);
            if (object instanceof Number) {
                return System.currentTimeMillis() - (Double) object;
            }
        }

        throw EvaluationException.createException(FunctionHelper.makeFunctionName(GremlinFunctionLibrary.NAMESPACE_PREFIX, FUNCTION_NAME), EvaluationException.EvaluationErrorType.UNSUPPORTED_PARAMETERS);

    }

    public String getName() {
        return FUNCTION_NAME;
    }

}
